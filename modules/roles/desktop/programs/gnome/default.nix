{
  config,
  lib,
  ...
}: let
  inherit (builtins) elem;
  inherit (lib.modules) mkIf;
  cfg = config.nice.host;
in {
  config = mkIf (elem "gnome" cfg.environments) {
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
