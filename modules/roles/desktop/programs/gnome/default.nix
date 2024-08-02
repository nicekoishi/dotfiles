{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = config.nice.host;
in {
  config = mkIf (builtins.elem "gnome" cfg.environments) {
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
