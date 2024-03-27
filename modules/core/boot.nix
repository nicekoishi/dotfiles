{
  pkgs,
  config,
  ...
}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;

    initrd = {
      systemd.enable = true;
      supportedFilesystems = ["ntfs"];
    };

    consoleLogLevel = 3;
    kernelParams = [
      "quiet"
      "systemd.show_status=auto"
      "rd.udev.log_level=3"
    ];

    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        configurationLimit = 12;
        consoleMode = "max";
      };
    };
  };

  environment.systemPackages = [config.boot.kernelPackages.cpupower];
}
