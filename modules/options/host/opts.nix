{
  config,
  lib,
  pkgs,
  ...
}: let
  # inherit (lib.modules) mkMerge;
  inherit (lib.options) mkOption;
  inherit (lib.types) bool;

  cfg = config.nice.modules.host;
in {
  options.nice.modules.host = {
    kernel = mkOption {
      default = pkgs.linuxPackages_zen;
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
