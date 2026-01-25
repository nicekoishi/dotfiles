{
  osConfig,
  pkgs,
  ...
}: let
  inherit (cfg.qt) theme;

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
    "qt5ct/qt5ct.conf".source = qtctConf "-1,5,50,0,0,0,0,0";
    "qt6ct/qt6ct.conf".source = qtctConf "-1,5,400,0,0,0,0,0,0,0,0,0,0,1";
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
  };

  home = {
    packages = with pkgs; [
      # it did happen
      qt6Packages.qt6ct
      libsForQt5.qt5ct
      theme.package

      # fix qt platform plugin not found
      libsForQt5.qt5.qtwayland
      libsForQt5.qt5.qtsvg
      kdePackages.breeze
      kdePackages.qtwayland
      kdePackages.qtsvg
      kdePackages.qqc2-desktop-style
      kdePackages.plasma-integration
      qt6.qtwayland
      qt6.qtsvg
    ];

    sessionVariables = {
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_QPA_PLATFORM = "wayland;xcb";
      DISABLE_QT5_COMPAT = "0";
    };
  };
}
