{pkgs, ...}: {
  # nix has a qemu hook option? caguei

  # both of vfio scripts are available in gitlab:
  # risingprismtv/single-gpu-passthrough

  systemd.services.libvirtd = {
    # r/VFIO u/some_random_guy
    path = let
      env = pkgs.buildEnv {
        name = "qemu-hook-env";
        paths = with pkgs; [
          bash
          libvirt
          kmod
          systemd
          ripgrep
        ];
      };
    in [env];

    preStart = ''
      mkdir -p /var/lib/libvirt/hooks 
      cp --remove-destination ${./qemu} /var/lib/libvirt/hooks/qemu
      chmod +x /var/lib/libvirt/hooks/qemu
    '';
  };
  environment.systemPackages = [
    (pkgs.writeShellScriptBin "vfio-startup" ''
      ## Adds current time to var for use in echo for a cleaner log and script ##
      DATE=$(date +"%m/%d/%Y %R:%S :")

      ## Sets dispmgr var as null ##
      DISPMGR="null"

      ################################## Script ###################################

      echo "$DATE Beginning of Startup!"

      systemctl stop greetd.service

      ##############################################################################################################################
      ## Unbind VTconsoles if currently bound (adapted and modernised from https://www.kernel.org/doc/Documentation/fb/fbcon.txt) ##
      ##############################################################################################################################
      if test -e "/tmp/vfio-bound-consoles"; then
          rm -f /tmp/vfio-bound-consoles
      fi
      for (( i = 0; i < 16; i++))
      do
        if test -x /sys/class/vtconsole/vtcon"$\{i}"; then
            if [ "$(grep -c "frame buffer" /sys/class/vtconsole/vtcon"$\{i}"/name)" = 1 ]; then
      	       echo 0 > /sys/class/vtconsole/vtcon"$\{i}"/bind
                 echo "$DATE Unbinding Console $\{i}"
                 echo "$i" >> /tmp/vfio-bound-consoles
            fi
        fi
      done

      sleep "1"

      if lspci -nn | grep -e VGA | grep -s NVIDIA ; then
          echo "$DATE System has an NVIDIA GPU"
          grep -qsF "true" "/tmp/vfio-is-nvidia" || echo "true" >/tmp/vfio-is-nvidia
          echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/unbind

          ## Unload NVIDIA GPU drivers ##
          modprobe -r nvidia_uvm
          modprobe -r nvidia_drm
          modprobe -r nvidia_modeset
          modprobe -r nvidia
          modprobe -r i2c_nvidia_gpu

          echo "$DATE NVIDIA GPU Drivers Unloaded"
      fi

      if lspci -nn | grep -e VGA | grep -s AMD ; then
          echo "$DATE System has an AMD GPU"
          grep -qsF "true" "/tmp/vfio-is-amd" || echo "true" >/tmp/vfio-is-amd
          echo efi-framebuffer.0 > /sys/bus/platform/drivers/efi-framebuffer/unbind

          ## Unload AMD GPU drivers ##
          modprobe -r drm_kms_helper
          modprobe -r amdgpu
          modprobe -r radeon
          modprobe -r drm

          echo "$DATE AMD GPU Drivers Unloaded"
      fi

      ## Load VFIO-PCI driver ##
      modprobe vfio
      modprobe vfio_pci
      modprobe vfio_iommu_type1

      echo "$DATE End of Startup!"
    '')

    (pkgs.writeShellScriptBin "vfio-teardown" ''
      ## As NoVideo is annoying, its better to restart than lose braincells
      ${pkgs.systemd}/bin/systemctl reboot
    '')
  ];
}
