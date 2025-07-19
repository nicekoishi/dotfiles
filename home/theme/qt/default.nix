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
  inherit (cfg.qt) kvantum theme;

  cfg = osConfig.nice.user.style;

  # https://github.com/fufexan/dotfiles/blob/41a68a6fa4312c2e83a813641fcc005e190b1116/home/programs/qt.nix#L15
  qtctConf = str: let
    font = "${cfg.gtk.font.name},${toString cfg.gtk.font.size}";
  in
    (pkgs.formats.ini {}).generate "qtct.conf" {
      Appearance = {
        color_scheme_path = "${theme.path}/${theme.name}.conf";
        custom_palette = true;
        icon_theme = cfg.gtk.iconTheme.name;
        standard_dialogs = "xdgdesktopportal";
        style = "breeze-dark";
      };

      Fonts = {
        fixed = "${font},${str}";
        general = "${font},${str}";
      };
    };
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

    "Kvantum/Catppuccin/Catppuccin.kvconfig".source = kvantum.kvconfig;
    "Kvantum/Catppuccin/Catppuccin.svg".source = kvantum.svg;

    "qt5ct/qt5ct.conf".source = qtctConf "-1,5,50,0,0,0,0,0";
    "qt6ct/qt6ct.conf".source = qtctConf "-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
  };

  qt = {
    enable = true;

    # kvantum doesn't go well with qtct anymore, change to qtct fully
    # https://github.com/fufexan/dotfiles/blob/41a68a6fa4312c2e83a813641fcc005e190b1116/home/programs/qt.nix#L26
    platformTheme.name = "qtct";
  };

  home = {
    packages = with pkgs;
      mkMerge [
        [
          # it did happen
          qt6Packages.qt6ct
          libsForQt5.qt5ct
          theme.package

          # fix qt platform plugin not found
          libsForQt5.qt5.qtwayland
          libsForQt5.qt5.qtsvg
          #libsForQt5.breeze-qt5
          kdePackages.breeze
          kdePackages.qtwayland
          kdePackages.qtsvg
          kdePackages.qqc2-desktop-style
          qt6.qtwayland
          qt6.qtsvg
        ]

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
