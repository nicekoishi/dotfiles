# will kvantum finally work?
{pkgs, ...}: let
  qtTheme = pkgs.catppuccin-kde.override {
    flavour = ["mocha"];
    accents = ["blue"];
    winDecStyles = ["modern"];
  };
in {
  # why qt is so weird?
  xdg.configFile = {
    "kdeglobals".source = "${qtTheme}/share/color-schemes/CatppuccinMochaBlue.colors";

    "Kvantum/kvantum.kvconfig".source = (pkgs.formats.ini {}).generate "kvantum.kvconfig" {
      General.theme = "catppuccin";
      Applications.catppuccin = ''
        qt5ct, qt6ct, org.kde.dolphin, org.qbittorrent.qBittorrent, hyprland-share-picker, cantata, org.prismlauncher.PrismLauncher
      '';
    };

    "Kvantum/catppuccin/catppuccin.kvconfig".source = builtins.fetchurl {
      url = "https://raw.githubusercontent.com/catppuccin/Kvantum/main/src/Catppuccin-Mocha-Blue/Catppuccin-Mocha-Blue.kvconfig";
      sha256 = "1f8xicnc5696g0a7wak749hf85ynfq16jyf4jjg4dad56y4csm6s";
    };

    "Kvantum/catppuccin/catppuccin.svg".source = builtins.fetchurl {
      url = "https://raw.githubusercontent.com/catppuccin/Kvantum/main/src/Catppuccin-Mocha-Blue/Catppuccin-Mocha-Blue.svg";
      sha256 = "0vys09k1jj8hv4ra4qvnrhwxhn48c2gxbxmagb3dyg7kywh49wvg";
    };
  };

  qt = {
    enable = true;
    platformTheme = "gtk";
    style.name = "kvantum";
  };

  home = {
    packages = with pkgs; [
      qtTheme

      qt6Packages.qt6ct
      libsForQt5.qt5ct
      qt6Packages.qtstyleplugin-kvantum
      libsForQt5.qtstyleplugin-kvantum
    ];

    sessionVariables = {
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_QPA_PLATFORM = "wayland";
      QT_STYLE_OVERRIDE = "kvantum";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      DISABLE_QT5_COMPAT = "0";
    };
  };
}
