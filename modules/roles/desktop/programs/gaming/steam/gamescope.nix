{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (config.nice) user;
in {
  config = mkIf user.apps.gaming {
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
