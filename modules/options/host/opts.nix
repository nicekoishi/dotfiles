{lib, ...}: let
  inherit (lib.options) mkOption;
  inherit (lib.types) bool enum listOf;
in {
  options.nice.host = {
    roles = mkOption {
      type = listOf (enum [
        "desktop"
        "gaming"
      ]);
      default = [];
    };
    environments = mkOption {
      type = listOf (enum [
        "hyprland"
        "gnome"
      ]);
    };
    waylandReady = mkOption {
      type = bool;
      internal = true;
    };
  };
}
