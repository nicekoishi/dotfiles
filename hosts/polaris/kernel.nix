{
  config,
  pkgs,
  ...
}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    blacklistedKernelModules = ["i2c_nvidia_gpu"];
    initrd.kernelModules = ["nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm"];
    initrd.systemd.enable = true;
    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];
    supportedFilesystems = ["ntfs"];
  };
}
