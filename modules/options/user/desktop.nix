{
  config,
  lib,
  ...
}: let
  inherit (builtins) elem;
  inherit (lib.options) mkOption;
  inherit (lib.types) bool enum listOf nullOr;

  cfg = config.nice.user;
  env = cfg.environments;

  mkCheckFor = desktop:
    if (env.setup == null)
    then false
    else elem desktop env.setup;

  wayland = mkOption {
    default = true;
    type = bool;
    readOnly = true;
    description = ''
      Whether this desktop environment has a Wayland compositor.
    '';
  };
in {
  options.nice.user = {
    environments = {
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

            Will be set to true if `config.nice.user.environments.setup` contains
            "gnome".
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

            Will be set to true if `config.nice.user.environments.setup` contains
            "Hyprland".
          '';
        };
      };
    };
  };
}
