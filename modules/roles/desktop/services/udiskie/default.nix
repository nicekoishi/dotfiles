{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = config.nice.user;
in {
  config = mkIf cfg.home-manager {
    services.udisks2.enable = true;
    home-manager.users.supeen = {
      services.udiskie.enable = true;
    };
  };
}
