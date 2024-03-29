{
  pkgs,
  config,
  self,
  ...
}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;

    initrd = {
      systemd.enable = true;
      supportedFilesystems = ["ntfs"];
    };

    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot = {
        enable = true;
        configurationLimit = 12;
        consoleMode = "max";
      };
    };

    consoleLogLevel = 3;
    kernelParams = [
      "quiet"
      "systemd-show_status=auto"
      "rd.udev.log_level=3"
    ];

    plymouth = {
      enable = true;
      theme = "funny-plymouth";
      themePackages = [self.packages."${pkgs.system}".funny-plymouth];
    };
  };
  environment.systemPackages = [config.boot.kernelPackages.cpupower];
}
