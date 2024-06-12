{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;

  qtct = colors:
    (pkgs.formats.ini {}).generate "qtct.conf" {
      Appearance = {
        icon_theme = "Papirus-Dark";
        standard_dialogs = "xdgdesktopportal";
        style = "kvantum-dark";
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
in {
  xdg.configFile = {
    "qt5ct/qt5ct.conf".source = qtct ./colors.conf;

    "qt6ct/qt6ct.conf".source = qtct ./colors.conf;
  };
}
