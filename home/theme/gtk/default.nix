{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.strings) concatStringsSep;
  inherit (lib.attrsets) mapAttrsToList;

  cfg = config.gtk;
  cfg2 = config.home.pointerCursor;

  theme = {
    light = {
      name = "Catppuccin-Latte-Standard-Blue-Light";
      package = pkgs.catppuccin-gtk.override {
        accents = ["blue"];
        tweaks = ["rimless"];
        variant = "mocha";
      };
    };
    dark = {
      name = "Catppuccin-Mocha-Standard-Blue-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = ["blue"];
        tweaks = ["rimless"];
        variant = "latte";
      };
    };
  };

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

  light = pkgs.writeShellApplication {
    name = "light-mode";
    runtimeInputs = with pkgs; [glib];
    text = ''
      ${sessionVariables}
      gsettings set org.gnome.desktop.interface gtk-theme "${theme.light.name}"
      gsettings set org.gnome.desktop.interface icon-theme "Papirus-Light"

      mkdir -p "${config.xdg.configHome}/gtk-2.0"
      ln -sf "${config.xdg.dataHome}/darkman-fixes/gtk2/gtkrc-light" "${config.xdg.configHome}/gtk-2.0/gtkrc"

      ln -sf "${config.xdg.dataHome}/darkman-fixes/gtk4/gtk-light.css" "${config.xdg.configHome}/gtk-4.0/theme.css"
    '';
  };

  dark = pkgs.writeShellApplication {
    name = "dark-mode";
    runtimeInputs = with pkgs; [glib];
    text = ''
      ${sessionVariables}
      gsettings set org.gnome.desktop.interface gtk-theme "${theme.dark.name}"
      gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"

      mkdir -p "${config.xdg.configHome}/gtk-2.0"
      ln -sf "${config.xdg.dataHome}/darkman-fixes/gtk2/gtkrc-dark" "${config.xdg.configHome}/gtk-2.0/gtkrc"

      ln -sf "${config.xdg.dataHome}/darkman-fixes/gtk4/gtk-dark.css" "${config.xdg.configHome}/gtk-4.0/theme.css"
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

    # have at least a fallback theme
    theme = {inherit (theme.dark) name;};

    gtk3.extraConfig = {
      gtk-xft-antialias = 1;
      gtk-xft-hinting = 1;
      gtk-xft-hintstyle = "hintslight";
    };

    gtk4 = {
      extraConfig = {
        gtk-xft-antialias = 1;
        gtk-xft-hinting = 1;
        gtk-xft-hintstyle = "hintslight";
      };

      extraCss = ''
        @import url("file://${config.xdg.configHome}/gtk-4.0/theme.css");
      '';
    };
  };

  # as we "aren't" using home-manager to build gtkrc
  home = {
    sessionVariables = {
      GTK2_RC_FILES = lib.mkForce "${config.xdg.configHome}/gtk-2.0/gtkrc";
    };

    # i really don't want to do that again
    packages = [
      theme.light.package
      theme.dark.package
    ];
  };

  xdg.dataFile = {
    "darkman-fixes/gtk2/gtkrc-light".text = gtk2rc theme.light.name "Papirus-Light";
    "darkman-fixes/gtk2/gtkrc-dark".text = gtk2rc theme.dark.name "Papirus-Dark";

    "darkman-fixes/gtk4/gtk-light.css".source = "${theme.light.package}/share/themes/${theme.light.name}/gtk-4.0/gtk.css";
    "darkman-fixes/gtk4/gtk-dark.css".source = "${theme.dark.package}/share/themes/${theme.dark.name}/gtk-4.0/gtk.css";
  };
}
