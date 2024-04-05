{
  pkgs,
  config,
  ...
}: {
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  # nixpkgs gruvbox doesn't work for gtk4, sadge
  gtk = {
    enable = true;
    font = {
      name = "Iosevka";
      size = 12;
      package = pkgs.nerdfonts.override {fonts = ["Iosevka"];};
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    theme = {
      name = "Catppuccin-Mocha-Standard-Teal-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["teal"];
        tweaks = ["rimless"];
        variant = "mocha";
      };
    };

    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
  };

  # home-manager qt module is broken, symlinking is the only way
  # pls remember when gruvbox has qt, do it
  qt = {
    enable = true;
    platformTheme = "qtct";
  };

  xdg.configFile = let
    qtctConf = colors: ''
      [Appearance]
      style=Catppuccin-Mocha
      icon_theme=Papirus-Dark
      standard-dialogs=xdgdesktopportal

      color_scheme_path=${colors}
      custom_palette=true

      [Interface]
      buttonbox_layout=0
      cursor_flash_time=1000
      dialog_buttons_have_icons=1
      gui_effects=General, AnimateMenu, AnimateCombo
      keyboard_scheme=2
      menus_have_icons=true
      show_shortcuts_in_context_menu=true
      toolbutton_style=4
      underline_shortut=1
      wheel_scroll_lines=3
    '';
  in {
    "qt5ct/qt5ct.conf".text = qtctConf ./colors-qtct.conf;
    "qt6ct/qt6ct.conf".text = qtctConf ./colors-qtct.conf;
  };
}
