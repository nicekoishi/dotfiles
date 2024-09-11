{lib, ...}: let
  inherit (lib.options) mkEnableOption mkOption;
  inherit (lib.types) enum listOf nullOr;
in {
  imports = [
    ./style

    ./display.nix
  ];

  options.nice.modules.user = {
    environments = mkOption {
      type = nullOr (listOf (enum [
        "hyprland"
        "gnome"
      ]));
      default = null;
    };

    home-manager.enable = mkEnableOption "Manage a user environment using Nix";
  };
}
