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
