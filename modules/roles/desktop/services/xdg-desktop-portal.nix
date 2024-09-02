{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (builtins) elem;
  inherit (lib.modules) mkIf;

  cfg = config.nice.modules;
  usr = cfg.user;
in {
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = false;

    # https://github.com/flatpak/xdg-desktop-portal/blob/1.18.1/doc/portals.conf.rst.in
    config = {
      common = {
        "org.freedesktop.impl.portal.Secret" = ["gnome-keyring"];
      };

      hyprland.default = ["hyprland" "gtk"];
      gnome.default = ["gnome" "gtk"];
    };

    # xdg-desktop-portal-hyprland doesn't implement a file chooser, so we need this
    # if it isn't already installed by GNOME in nice.modules.user.environments
    extraPortals = mkIf (!elem "gnome" usr.environments) [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}