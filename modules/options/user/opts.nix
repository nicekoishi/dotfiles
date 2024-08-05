{lib, ...}: let
  inherit (lib.options) mkEnableOption mkOption;
  #inherit (lib.types) bool;
in {
  options.nice.user = {
    home-manager =
      mkEnableOption "enable home-manager"
      // {
        description = "Manage a user environment using Nix";
      };
  };
}
