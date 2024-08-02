{lib, ...}: let
  inherit (lib.options) mkOption;
  inherit (lib.types) enum listOf;
in {
  options.nice.host = {
    cpu = mkOption {
      type = enum ["amd" "intel"];
    };
    gpu = mkOption {
      type = listOf (enum ["amd" "nvidia"]);
    };
  };
}
