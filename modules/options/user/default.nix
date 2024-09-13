{lib, ...}: let
  inherit (lib.options) mkEnableOption;
in {
  imports = [
    ./desktop
    ./style

    ./display.nix
  ];

  options.nice.user = {
    home-manager.enable = mkEnableOption "home-manager, to manage a user environment using Nix.";
  };
}
