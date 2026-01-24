{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;

  cfg = config.nice.host;
  sys = cfg.system;
in {
  config = mkIf sys.gpg.enable {
    programs = {
      gnupg.agent = {
        enable = true;
        enableSSHSupport = false;
      };
    };
  };
}
