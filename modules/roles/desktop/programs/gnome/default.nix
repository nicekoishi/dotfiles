{
  config,
  lib,
  ...
}: let
  inherit (builtins) elem;
  inherit (lib.modules) mkIf;

  cfg = config.nice.modules;
  usr = cfg.user;
in {
  config = mkIf (elem "gnome" usr.environments) {
    services.xserver = {
      enable = true;

      desktopManager.gnome.enable = true;
    };

    #environment.gnome.excludePackages = with pkgs;
    #  [
    #  ]
    #  ++ (with pkgs.gnome; []);
  };
}
