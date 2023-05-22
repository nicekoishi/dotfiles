{ config, pkgs, ... }:

{
  gtk = {
    enable = true;

    font = {
      name = "Iosevka";
      size = 12;
      package = (pkgs.nerdfonts.override { fonts = [ "Iosevka" ]; });
    };

    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
      name = "Catppuccin-Macchiato-Compact-Teal-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "teal" ];
        size = "compact";
        variant = "macchiato";
      };
    };
  };
}
