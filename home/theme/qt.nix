# https://github.com/NotAShelf/nyx/blob/main/homes/notashelf/themes/qt.nix
{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf mkMerge;
  inherit (lib.strings) concatStringsSep;
  inherit (lib.attrsets) mapAttrsToList;

  cfg = config.qt;

  sessionVariables = concatStringsSep "\n" (mapAttrsToList (key: value: ''
      export ${key}="${toString value}"
    '')
    config.home.sessionVariables);

  dark = pkgs.writeShellApplication {
    name = "dark-mode";
    runtimeInputs = with pkgs; [
      qt6Packages.qtstyleplugin-kvantum
      libsForQt5.qtstyleplugin-kvantum
    ];
    text = ''
      ${sessionVariables}
      kvantummanager --set catppuccin-mocha
    '';
  };

  light = pkgs.writeShellApplication {
    name = "light-mode";
    runtimeInputs = with pkgs; [
      qt6Packages.qtstyleplugin-kvantum
      libsForQt5.qtstyleplugin-kvantum
    ];
    text = ''
      ${sessionVariables}
      kvantummanager --set catppuccin-latte
    '';
  };

  qt-dark = pkgs.catppuccin-kde.override {
    flavour = ["mocha"];
    accents = ["blue"];
    winDecStyles = ["modern"];
  };

  qt-light = pkgs.catppuccin-kde.override {
    flavour = ["latte"];
    accents = ["blue"];
    winDecStyles = ["modern"];
  };
in {
  # why qt is so weird?
  xdg.configFile = let
    url = "https://raw.githubusercontent.com/catppuccin/Kvantum/main/src";
  in {
    "Kvantum/catppuccin-latte/catppuccin-latte.kvconfig".source = builtins.fetchurl {
      url = "${url}/Catppuccin-Latte-Blue/Catppuccin-Latte-Blue.kvconfig";
      sha256 = "1dw919x8d8466ijj77sy9g3xgk3xnmpfnpi41r31a1s9x92812gz";
    };

    "Kvantum/catppuccin-latte/catppuccin-latte.svg".source = builtins.fetchurl {
      url = "${url}/Catppuccin-Latte-Blue/Catppuccin-Latte-Blue.svg";
      sha256 = "0czkghc2b9x33h6g09xsqfm91ryv67a24rcl6a1ppmgs1naw7j6r";
    };

    "Kvantum/catppuccin-mocha/catppuccin-mocha.kvconfig".source = builtins.fetchurl {
      url = "${url}/Catppuccin-Mocha-Blue/Catppuccin-Mocha-Blue.kvconfig";
      sha256 = "1f8xicnc5696g0a7wak749hf85ynfq16jyf4jjg4dad56y4csm6s";
    };

    "Kvantum/catppuccin-mocha/catppuccin-mocha.svg".source = builtins.fetchurl {
      url = "${url}/Catppuccin-Mocha-Blue/Catppuccin-Mocha-Blue.svg";
      sha256 = "0vys09k1jj8hv4ra4qvnrhwxhn48c2gxbxmagb3dyg7kywh49wvg";
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = {
      name = "kvantum";
      package = [
        qt-dark
        qt-light
      ];
    };
  };

  services.darkman = mkIf (cfg.style.name
    == "kvantum") {
    darkModeScripts = {qt = lib.getExe dark;};
    lightModeScripts = {qt = lib.getExe light;};
  };

  home = {
    packages = with pkgs;
      mkMerge [
        [
          qt6Packages.qt6ct
          libsForQt5.qt5ct
          breeze-icons
        ]

        # so thats why it never worked, because some dumbass broke it
        (mkIf (cfg.platformTheme.name
          == "gtk") [
          libsForQt5.qtstyleplugins
          qt6Packages.qt6gtk2
        ])

        (mkIf (cfg.style.name
          == "kvantum") [
          qt6Packages.qtstyleplugin-kvantum
          libsForQt5.qtstyleplugin-kvantum
        ])
      ];

    sessionVariables = {
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      DISABLE_QT5_COMPAT = "0";
    };
  };
}
