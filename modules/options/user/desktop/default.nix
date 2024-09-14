{
  config,
  lib,
  ...
}: let
  inherit (builtins) elem;
  inherit (lib.options) mkOption;
  inherit (lib.types) bool enum listOf nullOr;

  cfg = config.nice.user;
  env = cfg.desktop;

  mkCheckFor = desktop:
    if (env.setup == null)
    then false
    else elem desktop env.setup;

  wayland = mkOption {
    default = true;
    type = bool;
    internal = true;
    description = ''
      Whether this desktop environment is a Wayland compositor.
    '';
  };
in {
  options.nice.user = {
    desktop = {
      setup = mkOption {
        default = null;
        type = nullOr (listOf (enum [
          "Hyprland"
          "GNOME"
        ]));
        description = ''
          A list containing all desktop environments to be enabled.
        '';
      };

      gnome = {
        inherit wayland;

        enable = mkOption {
          default = mkCheckFor "GNOME";
          type = bool;
          description = ''
            Whether to enable the GNOME desktop environment.

            Will be set to true if `config.nice.user.desktop.setup` contains
            "GNOME".
          '';
        };
      };

      hyprland = {
        inherit wayland;

        enable = mkOption {
          default = mkCheckFor "Hyprland";
          type = bool;
          description = ''
            Whether to enable the Hyprland wayland compositor

            Will be set to true if `config.nice.user.desktop.setup` contains
            "Hyprland".
          '';
        };
      };
    };
  };
}
