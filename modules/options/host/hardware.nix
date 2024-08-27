{lib, ...}: let
  inherit (lib.options) mkOption;
  inherit (lib.types) enum listOf nullOr;
in {
  options.nice.modules.host = {
    cpu = mkOption {
      type = nullOr (enum ["amd" "intel"]);
      default = null;
    };
    gpu = mkOption {
      type = nullOr (listOf (enum ["amd" "nvidia"]));
      default = null;
    };
  };
}
