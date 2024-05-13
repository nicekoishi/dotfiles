{
  config,
  lib,
  pkgs,
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
    runtimeInputs = [pkgs.glib];
    text = ''
      ${sessionVariables}
      gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Mocha-Standard-Blue-Dark"
      gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"
    '';
  };

  light = pkgs.writeShellApplication {
    name = "light-mode";
    runtimeInputs = [pkgs.glib];
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
      package = pkgs.catppuccin-gtk.override {
        accents = ["blue"];
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
