{
  config,
  lib,
  ...
}: let
  inherit (builtins) elem;
  inherit (lib.modules) mkIf;
  cfg = config.nice.host;
in {
  config = mkIf (elem "gaming" cfg.roles) {
    programs.gamescope = {
      enable = true;
      capSysNice = true;

      args = [
        "--rt"
        "--expose-wayland"
      ];
    };
  };
}
