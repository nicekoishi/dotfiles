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
        qt5ct, qt6ct, org.kde.dolphin, org.qbittorrent.qBittorrent, hyprland-share-picker, cantata, org.prismlauncher.PrismLauncher
      '';
    };

    "Kvantum/catppuccin/catppuccin.kvconfig".source = builtins.fetchurl {
      url = "https://raw.githubusercontent.com/catppuccin/Kvantum/main/src/Catppuccin-Mocha-Teal/Catppuccin-Mocha-Teal.kvconfig";
      sha256 = "1kzlb0vgy22dh5jhbba6pmaf7jxx7ab18g4ns2r6nxw2l3i4sdjq";
    };

    "Kvantum/catppuccin/catppuccin.svg".source = builtins.fetchurl {
      url = "https://raw.githubusercontent.com/catppuccin/Kvantum/main/src/Catppuccin-Mocha-Teal/Catppuccin-Mocha-Teal.svg";
      sha256 = "1fny82l3m9334f64qlxz4s7l6dqgqiahsk2pj9srfwv8cql1jmv1";
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
    style.name = "kvantum";
  };

  home.packages = with pkgs; [
    themeQt

    qt6Packages.qt6ct
    libsForQt5.qt5ct
    qt6Packages.qtstyleplugin-kvantum
    libsForQt5.qtstyleplugin-kvantum
  ];

  home.sessionVariables = {
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    QT_QPA_PLATFORM = "wayland";
    QT_STYLE_OVERRIDE = "kvantum";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    DISABLE_QT5_COMPAT = "0";
  };
}
