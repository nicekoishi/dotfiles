{
  pkgs,
  config,
  ...
}: {
  xdg.systemDirs.data = let
    schema = pkgs.gsettings-desktop-schemas;
  in ["${schema}/share/gsettings-schemas/${schema.name}"];

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
        tweaks = ["normal"];
        variant = "mocha";
      };
    };

    gtk2 = {
      configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
      extraConfig = ''
        gtk-xft-antialias=1
        gtk-xft-hinting=1
        gtk-xft-hintstyle="hintslight"
        gtk-xft-rgba="rgb"
      '';
    };

    gtk3.extraConfig = {
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
      gtk-application-prefer-dark-theme = true;
    };

    gtk4.extraConfig = {
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
      gtk-application-prefer-dark-theme = true;
    };
  };
}
