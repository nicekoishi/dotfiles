# will kvantum finally work?
{pkgs, ...}: let
  themeQt = pkgs.catppuccin-kde.override {
    flavour = ["mocha"];
    accents = ["teal"];
    winDecStyles = ["modern"];
  };
in {
  # why qt is so weird?
  xdg.configFile = {
    "kdeglobals".source = "${themeQt}/share/color-schemes/CatppuccinMochaTeal.colors";

    "Kvantum/kvantum.kvconfig".source = (pkgs.formats.ini {}).generate "kvantum.kvconfig" {
      General.theme = "catppuccin";
      Applications.catppuccin = ''
        qt5ct, org.qbittorrent.qBittorrent, hyprland-share-picker, cantata, PrismLauncher
      '';
    };

    "Kvantum/catppuccin/catppuccin.kvconfig".source = builtins.fetchurl {
      url = "https://raw.githubusercontent.com/catppuccin/Kvantum/main/src/Catppuccin-Mocha-Teal/Catppuccin-Mocha-Teal.kvconfig";
      sha256 = "";
    };

    "Kvantum/catppuccin/catppuccin.svg".source = builtins.fetchurl {
      url = "https://raw.githubusercontent.com/catppuccin/Kvantum/main/src/Catppuccin-Mocha-Teal/Catppuccin-Mocha-Teal.svg";
      sha256 = "";
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
  };

  home.packages = with pkgs; [
    themeQt

    libsForQt5.qt5ct
    qt6Packages.qtstyleplugin-kvantum
    libsForQt5.qtstyleplugin-kvantum
  ];

  home.sessionVariables = {
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    DISABLE_QT5_COMPAT = "0";
  };
}
