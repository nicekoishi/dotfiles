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

  qtct = icon: colors:
    (pkgs.formats.ini {}).generate "qtct.conf" {
      Appearance = {
        icon_theme = builtins.toString icon;
        standard_dialogs = "xdgdesktopportal";
        style = "Breeze";
        color_scheme_path = builtins.toPath colors;
        custom_palette = true;
      };

      Interface = {
        activate_item_on_single_click = 1;
        buttonbox_layout = 3;
        cursor_flash_time = 1200;
        dialog_buttons_have_icons = 1;
        double_click_interval = 400;
        gui_effects = "General, AnimateMenu, AnimateCombo";
        keyboard_scheme = 2;
        menus_have_icons = true;
        show_shortcuts_in_context_menus = true;
        toolbutton_style = 4;
        underline_shortcut = 1;
        wheel_scroll_lines = 3;
      };
    };

  dark = pkgs.writeShellApplication {
    name = "dark-mode";
    runtimeInputs = with pkgs; [
      config.wayland.windowManager.hyprland.package
      coreutils
    ];
    text = ''
      mkdir -p "${config.xdg.configHome}/qt5ct"
      mkdir -p "${config.xdg.configHome}/qt6ct"

      ln -sf "${config.xdg.dataHome}/darkman-fixes/qtct/qtct-dark.conf" "${config.xdg.configHome}/qt5ct/qt5ct.conf"
      ln -sf "${config.xdg.dataHome}/darkman-fixes/qtct/qtct-dark.conf" "${config.xdg.configHome}/qt6ct/qt6ct.conf"
    '';
  };

  light = pkgs.writeShellApplication {
    name = "light-mode";
    runtimeInputs = with pkgs; [
      config.wayland.windowManager.hyprland.package
      coreutils
    ];
    text = ''
      mkdir -p "${config.xdg.configHome}/qt5ct"
      mkdir -p "${config.xdg.configHome}/qt6ct"

      ln -sf "${config.xdg.dataHome}/darkman-fixes/qtct/qtct-light.conf" "${config.xdg.configHome}/qt5ct/qt5ct.conf"
      ln -sf "${config.xdg.dataHome}/darkman-fixes/qtct/qtct-light.conf" "${config.xdg.configHome}/qt6ct/qt6ct.conf"
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
  # this way we can just change from kvantum to kvantum-dark on qtct, now how should we
  # change it...
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
      url = "${url}/Catppuccin-Latte-Blue/Catppuccin-Latte-Blue.kvconfig";
      sha256 = "1dw919x8d8466ijj77sy9g3xgk3xnmpfnpi41r31a1s9x92812gz";
    };

    "Kvantum/Catppuccin/Catppuccin.svg".source = builtins.fetchurl {
      url = "${url}/Catppuccin-Latte-Blue/Catppuccin-Latte-Blue.svg";
      sha256 = "0czkghc2b9x33h6g09xsqfm91ryv67a24rcl6a1ppmgs1naw7j6r";
    };

    "Kvantum/Catppuccin/CatppuccinDark.kvconfig".source = builtins.fetchurl {
      url = "${url}/Catppuccin-Mocha-Blue/Catppuccin-Mocha-Blue.kvconfig";
      sha256 = "1f8xicnc5696g0a7wak749hf85ynfq16jyf4jjg4dad56y4csm6s";
    };

    "Kvantum/Catppuccin/CatppuccinDark.svg".source = builtins.fetchurl {
      url = "${url}/Catppuccin-Mocha-Blue/Catppuccin-Mocha-Blue.svg";
      sha256 = "0vys09k1jj8hv4ra4qvnrhwxhn48c2gxbxmagb3dyg7kywh49wvg";
    };
  };

  xdg.dataFile = {
    "darkman-fixes/qtct/qtct-dark.conf".source = qtct "Papirus-Dark" ./colors-dark.conf;
    "darkman-fixes/qtct/qtct-light.conf".source = qtct "Papirus-Light" ./colors-light.conf;
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
  };

  services.darkman = mkIf cfg.enable {
    darkModeScripts.qt = lib.getExe dark;
    lightModeScripts.qt = lib.getExe light;
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
          qt-dark
          qt-light
        ]

        # so thats why it never worked, because some dumbass broke it
        # won't use it as we switch themes on demand, and gtk2 doesn't get its theme
        # from gsettings for some reason
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
