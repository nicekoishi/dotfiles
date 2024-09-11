{
  config,
  lib,
  ...
}: let
  inherit (lib.attrsets) hasAttr;
  inherit (lib.lists) optionals;
  inherit (lib.options) mkOption;
  inherit (lib.types) attrsOf either enum int nullOr package str submodule;

  cfg = config.nice.modules.user.display;
in {
  options.nice.modules.user = {
    display = {
      main = mkOption {
        default = null;
        type = nullOr str;
      };

      # adapted from vimjoyer's video:
      # https://www.youtube.com/watch?v=EUiXzX7nthY&t=200s
      monitors = mkOption {
        default = {};
        type = attrsOf (submodule {
          options = {
            width = mkOption {
              type = int;
              example = 1920;
            };

            height = mkOption {
              type = int;
              example = 1080;
            };

            refreshRate = mkOption {
              type = int;
              default = 60;
            };

            pos = mkOption {
              type = nullOr (enum ["top" "right" "bottom" "left"]);
              default = null;
              description = ''
                Used in a multi-monitor setup to properly position them.
              '';
            };

            scale = mkOption {
              type = int;
              default = 1;
            };

            wallpaper = mkOption {
              type = either str package;
            };
          };
        });
      };
    };
  };

  config = {
    warnings = optionals (!hasAttr cfg.main cfg.monitors) [
      ''
        ${cfg.main} is not a valid monitor in `config.nice.modules.user.display.monitors`!

        To suppress this warning, set `config.nice.modules.user.display.main`
        to a monitor already set in `config.nice.modules.user.display.monitors`
      ''
    ];
  };
}
