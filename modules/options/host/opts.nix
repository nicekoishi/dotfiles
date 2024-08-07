{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkMerge;
  inherit (lib.options) mkOption;
  inherit (lib.types) bool enum listOf nullOr;

  cfg = config.nice.host;
in {
  options.nice.host = {
    kernel = mkOption {
      default = pkgs.linuxPackages_zen;
    };

    environments = mkOption {
      type = nullOr (listOf (enum [
        "hyprland"
        "gnome"
      ]));
      default = null;
    };

    waylandReady = mkOption {
      type = bool;
      internal = true;
    };
  };

  config = {
    boot.kernelPackages = cfg.kernel;
  };
}
