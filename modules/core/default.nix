{
  config,
  lib,
  ...
}: {
  imports = [
    ./boot.nix
    ./graphics.nix
    ./security.nix
    ./users.nix
  ];

  i18n = let
    defaultLocale = "en_US.UTF-8";
    br = "pt_BR.UTF-8";
  in {
    inherit defaultLocale;
    extraLocaleSettings = {
      LC_COLLATE = defaultLocale;
      LC_CTYPE = defaultLocale;
      LC_MESSAGES = defaultLocale;

      LC_ADDRESS = br;
      LC_IDENTIFICATION = br;
      LC_MEASUREMENT = br;
      LC_MONETARY = br;
      LC_NAME = br;
      LC_NUMERIC = br;
      LC_PAPER = br;
      LC_TELEPHONE = br;
      LC_TIME = br;
    };

    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "pt_BR.UTF-8/UTF-8"
      "ja_JP.UTF-8/UTF-8"
    ];
  };

  time = {
    timeZone = "America/Sao_Paulo";
    hardwareClockInLocalTime = true; # windoes, why
  };

  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };

  zramSwap = {
    enable = true;
    memoryPercent = 90;
  };

  boot.kernel.sysctl = lib.mkIf config.zramSwap.enable {
    "vm.swappiness" = 180;
    "vm.watermark_boost_factor" = 0;
    "vm.watermark_scale_factor" = 125;
    "vm.page-cluster" = 0;
  };

  system.stateVersion = lib.mkDefault "23.11";
}
