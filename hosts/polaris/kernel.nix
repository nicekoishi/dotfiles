{
  config,
  pkgs,
  ...
}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    blacklistedKernelModules = ["i2c_nvidia_gpu"];
    initrd.systemd.enable = true;
    extraModulePackages = with config.boot.kernelPackages; [v4l2loopback];
    supportedFilesystems = ["ntfs"];
  };
}
