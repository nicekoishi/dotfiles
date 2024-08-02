{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (builtins) elem;
  inherit (lib.modules) mkIf;
  cfg = config.nice.host;
in {
  config = mkIf (elem "desktop" cfg.roles) {
    services.printing = {
      enable = true;
      drivers = with pkgs; [
        hplip
      ];
    };

    hardware.sane = {
      enable = true;
      extraBackends = with pkgs; [
        hplip
      ];
    };
  };
}
