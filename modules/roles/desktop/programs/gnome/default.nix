{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = config.nice;
  env = cfg.user.desktop;
in {
  config = mkIf env.gnome.enable {
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
