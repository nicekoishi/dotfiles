{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit
    (lib)
    mkEnableOption
    mkOption
    mkIf
    concatMapStrings
    types
    ;
  cfg = config.virtualisation.libvirtd.gpu-pass;
in {
  options.virtualisation.libvirtd.gpu-pass = {
    enable = mkEnableOption "gpu-pass, for gpu passthrough";

    devices = mkOption {
      type = types.listOf types.str;
      default = [];
      example = ["pci_0000_06_00_0" "pci_0000_06_00_1" "pci_0000_06_00_2" "pci_0000_06_00_3"];
      description = ''
        PCI Bus ID of the desired GPUs. You can find them by using lspci -k
        and/or virsh nodedev-list --cap pci.
      '';
    };

    guest = mkOption {
      type = types.str;
      default = "win10";
      example = "Windows";
      description = ''
        Name of your guest. Be sure to match exactly for the hook to work.
      '';
    };

    optimize = {
      enable = mkEnableOption "Dynamically isolate CPUs with systemd";
      host = mkOption {
        type = types.str;
        default = "0";
        example = "0-8";
        description = ''
          Isolate the host to the specified core(s), improving performance on the guest.
          This option passes straight to AllowedCPUs, so you can use any value you desire.
        '';
      };
      topography = mkOption {
        type = types.str;
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

              ${
            if config.hardware.nvidia.nvidiaPersistenced
            then "systemctl stop nvidia-persistenced.service"
            else ""
          }
              ${
            if cfg.optimize.enable
            then ''
              systemctl set-property --runtime -- user.slice AllowedCPUs=${cfg.optimize.host}
              systemctl set-property --runtime -- system.slice AllowedCPUs=${cfg.optimize.host}
              systemctl set-property --runtime -- init.scope AllowedCPUs=${cfg.optimize.host}
            ''
            else ""
          }

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
            then ''
              modprobe -r nvidia_uvm
              modprobe -r nvidia_drm
              modprobe -r nvidia_modeset
              modprobe -r nvidia
              modprobe -r i2c_nvidia_gpu
            ''
            else if builtins.elem "amdgpu" config.services.xserver.videoDrivers
            then ''
              modprobe -r amdgpu
            ''
            else builtins.throw "Unable to detect GPU! Are you using nouveau?"
          }

              ${concatMapStrings (i: "virsh nodedev-detach " + i + "\n") cfg.devices}

              modprobe vfio
              modprobe vfio_pci
              modprobe vfio_iommu_type1
              ;;

            "release")
              modprobe -r vfio_pci
              modprobe -r vfio_iommu_type1
              modprobe -r vfio

              ${concatMapStrings (i: "virsh nodedev-reattach " + i + "\n") cfg.devices}

              ${
            if builtins.elem "nvidia" config.services.xserver.videoDrivers
            then ''
              modprobe nvidia
              modprobe nvidia_modeset
              modprobe nvidia_drm
              modprobe nvidia_uvm
            ''
            else if builtins.elem "amdgpu" config.services.xserver.videoDrivers
            then ''
              modprobe amdgpu
            ''
            else builtins.throw "Unable to detect GPU! Are you using nouveau?"
          }

              ${
            if config.hardware.nvidia.nvidiaPersistenced
            then "systemctl start nvidia-persistenced.service"
            else ""
          }

              systemctl start display-manager.service

              ${
            if cfg.optimize.enable
            then ''
              systemctl set-property --runtime -- user.slice AllowedCPUs=${cfg.optimize.topography}
              systemctl set-property --runtime -- system.slice AllowedCPUs=${cfg.optimize.topography}
              systemctl set-property --runtime -- init.scope AllowedCPUs=${cfg.optimize.topography}
            ''
            else ""
          }
              ;;
          esac
        '';
      });
    };
  };
}
