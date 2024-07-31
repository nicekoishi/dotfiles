# https://github.com/NotAShelf/nyx/blob/main/homes/notashelf/themes/qt.nix
# this file quickly became quite the mess huh...
{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf mkMerge;
  inherit (lib.nice) capitalize;
  inherit (lib.strings) concatMapStrings hasPrefix;

  cfg = config.qt;

  # TODO: move this mess elsewhere, and tidy it up
  theme = {
    name = "Catppuccin";
    package = pkgs.catppuccin-kde.override theme.opts;
    opts = {
      flavour = ["mocha"];
      accents = ["blue"];
      winDecStyles = ["modern"];
    };
  };
in {
  # this will only work if only one flavour or accent is specified btw
  xdg.configFile = let
    url = "https://raw.githubusercontent.com/catppuccin/Kvantum/main/src";
    colors = "${theme.name + concatMapStrings (i: capitalize i) (theme.opts.flavour ++ theme.opts.accents)}";
  in {
    "kdeglobals".source = "${theme.package}/share/color-schemes/${colors}.colors";
    "Kvantum/kvantum.kvconfig".source = (pkgs.formats.ini {}).generate "kvantum.kvconfig" {
      General.theme = "${theme.name}";
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
    platformTheme.name = "gtk3";
    style.name = "kvantum";
  };

  home = {
    packages = with pkgs;
      mkMerge [
        [
          qt6Packages.qt6ct
          libsForQt5.qt5ct
          breeze-icons

          # just realized that i may be stupid
          theme.package
        ]

        (mkIf (hasPrefix "gtk" cfg.platformTheme.name) [
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
