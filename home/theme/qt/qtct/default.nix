{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;

  qtct = icon: colors:
    (pkgs.formats.ini {}).generate "qtct.conf" {
      Appearance = {
        icon_theme = builtins.toString icon;
        standard_dialogs = "xdgdesktopportal";
        style = "Breeze";
        color_scheme_path = "${/. + colors}";
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
in {
  services.darkman = mkIf config.qt.enable {
    darkModeScripts.qtct = lib.getExe dark;
    lightModeScripts.qtct = lib.getExe light;
  };

  xdg.dataFile = {
    "darkman-fixes/qtct/qtct-dark.conf".source = qtct "Papirus-Dark" ./colors-dark.conf;
    "darkman-fixes/qtct/qtct-light.conf".source = qtct "Papirus-Light" ./colors-light.conf;
  };
}
