{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (config.nice.host.opts) roles;
in {
  config = mkIf (builtins.elem "desktop" roles) {
    services.geoclue2.enable = true;
    location.provider = "geoclue2";
  };
}
