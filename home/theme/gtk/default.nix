{
  config,
  lib,
  pkgs,
  self,
  ...
}: let
  inherit (lib.strings) concatStringsSep;
  inherit (lib.attrsets) mapAttrsToList;

  cfg = config.gtk;
  cfg2 = config.home.pointerCursor;

  lightGtkTheme = "Catppuccin-Latte-Standard-Blue-Light";
  darkGtkTheme = "Catppuccin-Mocha-Standard-Blue-Dark";

  gtk2rc = theme: icon: ''
    gtk-cursor-theme-name = "${cfg2.name}"
    gtk-cursor-theme-size = ${builtins.toString cfg2.size}
    gtk-font-name = "${cfg.font.name + " " + builtins.toString cfg.font.size}"
    gtk-icon-theme-name = "${icon}"
    gtk-theme-name = "${theme}"

    gtk-xft-antialias=1
    gtk-xft-hinting=1
    gtk-xft-hintstyle="hintslight"
    gtk-xft-rgba="rgb"
  '';

  sessionVariables = concatStringsSep "\n" (mapAttrsToList (key: value: ''
      export ${key}="${toString value}"
    '')
    config.home.sessionVariables);

  dark = pkgs.writeShellApplication {
    name = "dark-mode";
    runtimeInputs = with pkgs; [glib];
    text = ''
      ${sessionVariables}
      gsettings set org.gnome.desktop.interface gtk-theme "${darkGtkTheme}"
      gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"

      mkdir -p "${config.xdg.configHome}/gtk-2.0"
      ln -sf "${config.xdg.dataHome}/darkman-fixes/gtk2/gtkrc-dark" "${config.xdg.configHome}/gtk-2.0/gtkrc"
    '';
  };

  light = pkgs.writeShellApplication {
    name = "light-mode";
    runtimeInputs = with pkgs; [glib];
    text = ''
      ${sessionVariables}
      gsettings set org.gnome.desktop.interface gtk-theme "${lightGtkTheme}"
      gsettings set org.gnome.desktop.interface icon-theme "Papirus-Light"

      mkdir -p "${config.xdg.configHome}/gtk-2.0"
      ln -sf "${config.xdg.dataHome}/darkman-fixes/gtk2/gtkrc-light" "${config.xdg.configHome}/gtk-2.0/gtkrc"
    '';
  };
in {
  xdg.systemDirs.data = let
    schema = pkgs.gsettings-desktop-schemas;
  in ["${schema}/share/gsettings-schemas/${schema.name}"];

  services.darkman = {
    darkModeScripts.gtk = lib.getExe dark;
    lightModeScripts.gtk = lib.getExe light;
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

  # as we aren't using home-manager to build gtkrc
  home.sessionVariables = {
    GTK2_RC_FILES = lib.mkForce "${config.xdg.configHome}/gtk-2.0/gtkrc";
  };

  xdg.dataFile = {
    "darkman-fixes/gtk2/gtkrc-light".text = gtk2rc "Catppuccin-Latte-Standard-Blue-Light" "Papirus-Light";
    "darkman-fixes/gtk2/gtkrc-dark".text = gtk2rc "Catppuccin-Mocha-Standard-Blue-Dark" "Papirus-Dark";
  };
}
