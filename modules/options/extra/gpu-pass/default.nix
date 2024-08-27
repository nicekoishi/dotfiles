{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (lib.options) mkEnableOption mkOption;
  inherit (lib.strings) concatMapStringsSep optionalString;
  inherit (lib.types) listOf str;

  toOptimize = cpu:
    concatMapStringsSep "\n" (slice: "systemctl set-property --runtime -- ${slice} AllowedCPUs=${cpu}") [
      "user.slice"
      "system.slice"
      "init.scope"
    ];
  cfg = config.nice.modules.extra.gpu-pass;
in {
  options.nice.modules.extra.gpu-pass = {
    enable = mkEnableOption "gpu-pass, for gpu passthrough";

    devices = mkOption {
      type = listOf str;
      default = [];
      example = ["pci_0000_06_00_0" "pci_0000_06_00_1" "pci_0000_06_00_2" "pci_0000_06_00_3"];
      description = ''
        PCI Bus ID of the desired GPUs. You can find them by using lspci -k
        and/or virsh nodedev-list --cap pci.
      '';
    };

    guest = mkOption {
      type = str;
      default = "win10";
      example = "Windows";
      description = ''
        Name of your guest. Be sure to match exactly for the hook to work.
      '';
    };

    optimize = {
      enable = mkEnableOption "Dynamically isolate CPUs with systemd";
      host = mkOption {
        type = str;
        default = "0";
        example = "0-8";
        description = ''
          Isolate the host to the specified core(s), improving performance on the guest.
          This option passes straight to AllowedCPUs, so you can use any value you desire.
        '';
      };

      topography = mkOption {
        type = str;
        example = "0-11";
        description = ''
          When guest shutdowns, return these cores to the host. You can find them by using lscpu -e.
          For example, you can use 0-11 for a host with 12 CPUs.
          This option passes straight to AllowedCPUs, so you can use any value you desire.
        '';
      };
    };
  };

  config = mkIf cfg.enable {
    virtualisation.libvirtd.hooks.qemu = {
      "passthrough" = lib.getExe (pkgs.writeShellApplication {
        name = "qemu-hook";
        runtimeInputs = with pkgs; [
          kmod
          libvirt
          systemd
        ];

        text = ''
          GUEST="$1"
          OPERATION="$2"

          if [ "$GUEST" != ${cfg.guest} ]; then
            exit 0
          fi

          case "$OPERATION" in
            "prepare")
              systemctl stop display-manager.service

              ${optionalString config.hardware.nvidia.nvidiaPersistenced "systemctl stop nvidia-persistenced"}

              ${optionalString cfg.optimize.enable (toOptimize cfg.optimize.host)}

              if test -e "/tmp/vfio-bound-consoles"; then
                  rm -f /tmp/vfio-bound-consoles
              fi
              for (( i = 0; i < 16; i++))
              do
                if test -x /sys/class/vtconsole/vtcon"''${i}"; then
                    if [ "$(grep -c "frame buffer" /sys/class/vtconsole/vtcon"''${i}"/name)" = 1 ]; then
              	       echo 0 > /sys/class/vtconsole/vtcon"''${i}"/bind
                         echo "$i" >> /tmp/vfio-bound-consoles
                    fi
                fi
              done

              sleep 4

              ${
            if builtins.elem "nvidia" config.services.xserver.videoDrivers
            then
              concatMapStringsSep "\n" (module: "modprobe -r ${module}") [
                "nvidia_uvm"
                "nvidia_drm"
                "nvidia_modeset"
                "nvidia"
                "i2c_nvidia_gpu"
              ]
            else if builtins.elem "amdgpu" config.services.xserver.videoDrivers
            then ''
              modprobe -r amdgpu
            ''
            else builtins.throw "Unable to detect GPU!"
          }

              ${concatMapStringsSep "\n" (device: "virsh nodedev-detach ${device}") cfg.devices}

              ${
            concatMapStringsSep "\n" (module: "modprobe ${module}") [
              "vfio"
              "vfio_pci"
              "vfio_iommu_type1"
            ]
          }
              ;;
            "release")
          ${
            concatMapStringsSep "\n" (module: "modprobe -r ${module}") [
              "vfio-pci"
              "vfio_iommu_type1"
              "vfio"
            ]
          }

              ${concatMapStringsSep "\n" (device: "virsh nodedev-reattach ${device}") cfg.devices}

              ${
            if builtins.elem "nvidia" config.services.xserver.videoDrivers
            then
              concatMapStringsSep "\n" (module: "modprobe ${module}") [
                "nvidia"
                "nvidia_modeset"
                "nvidia_drm"
                "nvidia_uvm"
              ]
            else if builtins.elem "amdgpu" config.services.xserver.videoDrivers
            then ''
              modprobe amdgpu
            ''
            else builtins.throw "Unable to detect GPU!"
          }

              ${optionalString config.hardware.nvidia.nvidiaPersistenced "systemctl start nvidia-persistenced"}

              # TODO: handle cases where this isn't applicable, like sddm
              # and gdm
              systemctl start display-manager.service

              ${optionalString cfg.optimize.enable (toOptimize cfg.optimize.topography)}
              ;;
          esac
        '';
      });
    };
  };
}
