{lib, ...}: let
  inherit (lib.options) mkOption;
  inherit (lib.types) enum str listOf nullOr;
in {
  options.nice.host = {
    cpu = mkOption {
      default = null;
      type = nullOr (enum ["amd" "intel"]);
      description = "The manufacturer of the host's CPU.";
    };
    gpu = mkOption {
      default = null;
      #["amd" "nvidia" "amd-hybrid" "nv-hybrid"])
      type = nullOr (listOf str);
      description = ''
        The manufacturer of the host's GPU.
        Will be used to load the necessary drivers for optimal functionality.
      '';
    };
  };
}
