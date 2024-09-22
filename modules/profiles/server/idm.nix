{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = config.nice.host;
  srv = cfg.services;
in {
  config = mkIf srv.kanidm.enable {
    services = {
      acme = {};

      kanidm = {
        enable = true;
      };

      nginx = {};
    };
  };
}
