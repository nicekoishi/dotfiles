{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;
in {
  config = mkIf config.services.mpd.enable {
    home.packages = [pkgs.cantata];
  };
}
