{
  config,
  pkgs,
  ...
}: {
<<<<<<< HEAD
=======
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
    gtk.enable = true;
    x11.enable = true;
  };

>>>>>>> 12c72a1 (too lazy to separate them all)
  gtk = {
    enable = true;

    font = {
      name = "Iosevka";
      size = 12;
      package = pkgs.nerdfonts.override {fonts = ["Iosevka"];};
    };

    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";

    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };

    theme = {
<<<<<<< HEAD
      name = "Catppuccin-Macchiato-Compact-Teal-dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["teal"];
        size = "compact";
        variant = "macchiato";
      };
=======
      name = "gruvbox-dark";
      package = pkgs.gruvbox-dark-gtk;
>>>>>>> 12c72a1 (too lazy to separate them all)
    };
  };
}
