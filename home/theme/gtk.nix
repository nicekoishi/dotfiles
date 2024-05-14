{
  config,
  lib,
  pkgs,
  self,
  ...
}: let
  inherit (lib.strings) concatStringsSep;
  inherit (lib.attrsets) mapAttrsToList;

  sessionVariables = concatStringsSep "\n" (mapAttrsToList (key: value: ''
      export ${key}="${toString value}"
    '')
    config.home.sessionVariables);

  dark = pkgs.writeShellApplication {
    name = "dark-mode";
    runtimeInputs = with pkgs; [glib];
    text = ''
      ${sessionVariables}
      gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Mocha-Standard-Blue-Dark"
      gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
    '';
  };

  light = pkgs.writeShellApplication {
    name = "light-mode";
    runtimeInputs = with pkgs; [glib];
    text = ''
      ${sessionVariables}
      gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Latte-Standard-Blue-Light"
      gsettings set org.gnome.desktop.interface icon-theme "Papirus-Light"
    '';
  };
in {
  xdg.systemDirs.data = let
    schema = pkgs.gsettings-desktop-schemas;
  in ["${schema}/share/gsettings-schemas/${schema.name}"];

  services.darkman = {
    darkModeScripts = {gtk = lib.getExe dark;};
    lightModeScripts = {gtk = lib.getExe light;};
  };

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
      name = "Catppuccin-Mocha-Standard-Blue-Dark";
      package = self.packages."${pkgs.system}".catppuccin-gtk;
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
    };

    gtk4.extraConfig = {
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
    };
  };

  # attempt at fixing gtk2 theming when using darkman
  # such method doesn't work as we need to find a way to pass our
  # new GTK2_RC_FILES to all gtk2 apps
  # home.activation.gtk2-fix = lib.hm.dag.entryAfter ["writeBoundary"] ''
  #  if [ ! -f "${config.gtk.gtk2.configLocation}-light" ]; then
  #    run ${pkgs.gawk}/bin/gawk -F' = ' '/^gtk-theme-name/ {gsub(/".*"/, "\"Catppuccin-Latte-Standard-Blue-Light\"")} {print}'\
  #        "${config.gtk.gtk2.configLocation}" > "${config.gtk.gtk2.configLocation}-light"
  #  fi
  #'';
}
