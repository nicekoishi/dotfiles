{pkgs, ...}: {
  nice.host.system = {
    kernel = pkgs.linuxPackages_zen;
  };

  hardware.nvidia.prime = {
    # lspci | grep -i vga
    amdgpuBusId = "PCI:13:0:0";
    nvidiaBusId = "PCI:1:0:0";
  };

  services.udev.extraRules = ''
    KERNEL=="card*", KERNELS=="0000:13:00.0", SUBSYSTEM=="drm", SUBSYSTEMS=="pci", SYMLINK+="dri/amd-igpu"
    KERNEL=="card*", KERNELS=="0000:01:00.0", SUBSYSTEM=="drm", SUBSYSTEMS=="pci", SYMLINK+="dri/nvidia-gpu"
  '';

  environment.sessionVariables = {
    AQ_DRM_DEVICES = "/dev/dri/amd-igpu:/dev/dri/nvidia-gpu";
  };
}
