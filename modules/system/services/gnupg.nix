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
      ssh.startAgent = false;
      gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
      };
    };
  };
}
