{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = config.nice;
  usr = cfg.user;
in {
  config = mkIf usr.home-manager.enable {
    services.udisks2.enable = true;
    home-manager.users.supeen = {
      services.udiskie.enable = true;
    };
  };
}
