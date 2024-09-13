{lib, ...}: let
  inherit (lib.options) mkOption;
  inherit (lib.types) enum listOf nullOr;
in {
  options.nice.modules.host = {
    cpu = mkOption {
      default = null;
      type = nullOr (enum ["amd" "intel"]);
      description = "The manufacturer of the host's CPU.";
    };
    gpu = mkOption {
      default = null;
      type = nullOr (listOf (enum ["amd" "nvidia"]));
      description = ''
        The manufacturer of the host's GPU.
        Will be used to load the necessary drivers for optimal functionality.
      '';
    };
  };
}
