{
  lib,
  pkgs,
  ...
}: let
  inherit (lib.options) mkOption;
  inherit (lib.types) bool;
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
}
