{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (config.nice.host.opts) roles;
in {
  config = mkIf (builtins.elem "desktop" roles) {
    systemd.settings.Manager = {
      DefaultTimeoutStartSec = "10s";
      DefaultTimeoutStopSec = "10s";
    };
  };
}
