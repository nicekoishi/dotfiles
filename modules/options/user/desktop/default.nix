{
  config,
  lib,
  ...
}: let
  inherit (builtins) elem;
  inherit (lib.options) mkOption;
  inherit (lib.types) bool enum listOf;

  cfg = config.nice.user;
  env = cfg.desktop;

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
        default = ["none"];
        type = listOf (enum [
          "Hyprland"
          "GNOME"

          # This is the default for headless systems btw
          "none"
        ]);
        description = ''
          A list containing all desktop environments to be enabled.
        '';
      };

      gnome = {
        inherit wayland;

        enable = mkOption {
          default = elem "GNOME" env.setup;
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
          default = elem "Hyprland" env.setup;
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
