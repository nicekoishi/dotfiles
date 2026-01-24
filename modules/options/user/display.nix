{
  config,
  lib,
  self',
  ...
}: let
  inherit (lib.lists) optionals;
  inherit (lib.options) mkOption;
  inherit (lib.types) attrsOf either enum int nullOr package str submodule;
  inherit (self'.packages) wallpapers;

  cfg = config.nice.user.display;
in {
  options.nice.user = {
    display = {
      main = mkOption {
        default = null;
        type = nullOr str;
        description = ''
          The main display in the configuration.
          Will be used as a reference to properly align other monitors.
        '';
      };

      # adapted from vimjoyer's video:
      # https://www.youtube.com/watch?v=EUiXzX7nthY&t=200s
      monitors = mkOption {
        default = {};
        description = ''
          Attribute set containing all monitors used in this configuration.

          This will break all kinds of monitor setup if these services
          are enabled and this option don't have any monitor set up.
        '';
        type = attrsOf (submodule {
          options = {
            width = mkOption {
              type = int;
              example = 1920;
              description = "The width of this monitor.";
            };

            height = mkOption {
              type = int;
              example = 1080;
              description = "The height of this monitor.";
            };

            refreshRate = mkOption {
              type = int;
              default = 60;
              description = "The refresh rate of this monitor.";
            };

            pos = mkOption {
              default = null;
              type = nullOr (enum ["top" "right" "bottom" "left"]);
              description = ''
                Used in a multi-monitor setup to properly position them.
              '';
            };

            scale = mkOption {
              default = 1;
              type = int;
              description = "The scale of this monitor, usually 1 is enough.";
            };

            wallpaper = mkOption {
              default =
                if cfg.monitors != {}
                then "${wallpapers}/share/wallpapers/kayoko.png"
                else null;
              type = either str package;
              description = ''
                Desired wallpaper for this monitor.
                Will be used by services such as hyprpaper/swww.
              '';
            };
          };
        });
      };
    };
  };

  config = {
    # NOTE: Any Nix magicians can explain me why the hell this won't work
    # referring to attrset itself, but it does when I interpolate it?
    # (... && !( cfg.monitors ? cfg.main ))
    warnings = optionals (cfg.main != null && !(cfg.monitors ? "${cfg.main}")) [
      ''
        ${cfg.main} is not a valid monitor in `config.nice.user.display.monitors`!

        To suppress this warning, set `config.nice.user.display.main`
        to a monitor already set in `config.nice.user.display.monitors`
      ''
    ];
  };
}
