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
    virtualisation.waydroid.enable = true;
  };
}
