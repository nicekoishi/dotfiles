{lib, ...}: let
  inherit (lib.options) mkEnableOption;
in {
  imports = [
    ./style

    ./desktop.nix
    ./display.nix
  ];

  options.nice.user = {
    home-manager.enable = mkEnableOption "home-manager, to manage a user environment using Nix.";
  };
}
