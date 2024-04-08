{lib, ...}: {
  imports = [
    ./boot.nix
    ./opengl.nix
    ./security.nix
    ./users.nix
  ];

  i18n = {
    defaultLocale = "en_US.utf8";
    extraLocaleSettings = {
      LC_ADDRESS = "pt_BR.utf8";
      LC_IDENTIFICATION = "pt_BR.utf8";
      LC_MEASUREMENT = "pt_BR.utf8";
      LC_MONETARY = "pt_BR.utf8";
      LC_NAME = "pt_BR.utf8";
      LC_NUMERIC = "pt_BR.utf8";
      LC_PAPER = "pt_BR.utf8";
      LC_TELEPHONE = "pt_BR.utf8";
      LC_TIME = "pt_BR.utf8";
    };
  };

  time = {
    timeZone = "America/Sao_Paulo";
    hardwareClockInLocalTime = true; # windoes, why
  };

  zramSwap = {
    enable = true;
    memoryPercent = 90;
  };

  system.stateVersion = lib.mkDefault "23.11";
}
