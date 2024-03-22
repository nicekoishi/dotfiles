{
  config,
  pkgs,
  ...
}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    blacklistedKernelModules = ["i2c_nvidia_gpu"];
<<<<<<< HEAD
    initrd.kernelModules = ["nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm"];
=======
>>>>>>> 12c72a1 (too lazy to separate them all)
    initrd.systemd.enable = true;
    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];
    supportedFilesystems = ["ntfs"];
  };
}
