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
      description = ''
        List containing all desired environments for a specific host.
      '';
    };

    home-manager.enable = mkEnableOption "home-manager, to manage a user environment using Nix.";
  };
}
