{
  config,
  lib,
  ...
}: let
  inherit (builtins) elem;
  inherit (lib.modules) mkIf;
  cfg = config.nice.host;
in {
  config = mkIf (elem "desktop" cfg.roles) {
    systemd = let
      timeout = ''
        DefaultTimeoutStartSec=10s
        DefaultTimeoutStopSec=10s
      '';
    in {
      extraConfig = timeout;
      user.extraConfig = timeout;
    };
  };
}
