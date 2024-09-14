# https://github.com/NotAShelf/nyx/blob/main/homes/notashelf/themes/qt.nix
# this file quickly became quite the mess huh...
{
  lib,
  osConfig,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf mkMerge;
  inherit (lib.strings) concatStringsSep;
  inherit (cfg.qt) theme kvantum;

  cfg = osConfig.nice.user.style;
in {
  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".source = (pkgs.formats.ini {}).generate "kvantum.kvconfig" {
      General.theme = "Catppuccin";
      Applications.Catppuccin = concatStringsSep ", " [
        "qt5ct"
        "org.kde.dolphin"
        "org.qbittorrent.qBittorrent"
        "hyprland-share-picker"
        "cantata"
        "org.kde.kid3-qt"
      ];
    };

    "kdeglobals".source = theme.kdeglobals;
    "Kvantum/Catppuccin/Catppuccin.kvconfig".source = kvantum.kvconfig;
    "Kvantum/Catppuccin/Catppuccin.svg".source = kvantum.svg;
  };

  qt = {
    enable = true;
    platformTheme = {
      name = mkIf cfg.qt.useGtk "gtk3";
      package = [];
    };

    style = {
      name = mkIf cfg.qt.useKvantum "kvantum";
      package = [];
    };
  };

  home = {
    packages = with pkgs;
      mkMerge [
        [
          # what if
          qt6Packages.qt6ct
          libsForQt5.qt5ct
          breeze-icons
          theme.package

          # fix qt platform plugin not found
          libsForQt5.qt5.qtwayland
          libsForQt5.qt5.qtsvg
          libsForQt5.breeze-qt5
          kdePackages.qtwayland
          kdePackages.qtsvg
          kdePackages.qqc2-desktop-style
          qt6.qtwayland
          qt6.qtsvg
        ]

        (mkIf cfg.qt.useGtk [
          libsForQt5.qtstyleplugins
          qt6Packages.qt6gtk2
        ])

        (mkIf cfg.qt.useKvantum [
          qt6Packages.qtstyleplugin-kvantum
          libsForQt5.qtstyleplugin-kvantum
        ])
      ];

    sessionVariables = {
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_QPA_PLATFORM = "wayland;xcb";
      DISABLE_QT5_COMPAT = "0";
    };
  };
}
