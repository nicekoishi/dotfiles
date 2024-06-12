# https://github.com/NotAShelf/nyx/blob/main/homes/notashelf/themes/qt.nix
# this file quickly became quite the mess huh...
{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf mkMerge;

  cfg = config.qt;

  themePkg = pkgs.catppuccin-kde.override {
    flavour = ["mocha"];
    accents = ["blue"];
    winDecStyles = ["modern"];
  };
in {
  imports = [
    ./qtct
  ];

  # why qt is so weird?
  # ended up giving up on switching, too much of a headache (literally)
  xdg.configFile = let
    url = "https://raw.githubusercontent.com/catppuccin/Kvantum/main/src";
  in {
    "Kvantum/kvantum.kvconfig".source = (pkgs.formats.ini {}).generate "kvantum.kvconfig" {
      General.theme = "Catppuccin";
      Applications.Catppuccin = ''
        qt5ct, org.kde.dolphin, org.qbittorrent.qBittorrent, hyprland-share-picker, cantata, org.kde.kid3-qt
      '';
    };
    "Kvantum/Catppuccin/Catppuccin.kvconfig".source = builtins.fetchurl {
      url = "${url}/Catppuccin-Mocha-Blue/Catppuccin-Mocha-Blue.kvconfig";
      sha256 = "1f8xicnc5696g0a7wak749hf85ynfq16jyf4jjg4dad56y4csm6s";
    };

    "Kvantum/Catppuccin/Catppuccin.svg".source = builtins.fetchurl {
      url = "${url}/Catppuccin-Mocha-Blue/Catppuccin-Mocha-Blue.svg";
      sha256 = "0vys09k1jj8hv4ra4qvnrhwxhn48c2gxbxmagb3dyg7kywh49wvg";
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  home = {
    packages = with pkgs;
      mkMerge [
        [
          qt6Packages.qt6ct
          libsForQt5.qt5ct
          breeze-icons

          # trying to use qt.style.name will set QT_STYLE_OVERRIDE
          # qtct won't work with that variable, so we install our theme here
          themePkg
        ]

        (mkIf (cfg.platformTheme.name
          == "gtk") [
          libsForQt5.qtstyleplugins
          qt6Packages.qt6gtk2
        ])

        (mkIf (cfg.style.name == "kvantum") [
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
