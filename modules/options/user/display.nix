{
  config,
  lib,
  ...
}: let
  inherit (lib.attrsets) filterAttrs mapAttrsToList;
  inherit (lib.lists) count optionals;
  inherit (lib.options) mkEnableOption mkOption;
  inherit (lib.strings) concatStringsSep;
  inherit (lib.types) attrsOf either enum int nullOr package str submodule;

  cfg = config.nice.modules.user;
in {
  options.nice.modules.user = {
    # adapted from vimjoyer's video:
    # https://www.youtube.com/watch?v=EUiXzX7nthY&t=200s
    monitors = mkOption {
      default = {};
      type = attrsOf (submodule {
        options = {
          main = mkEnableOption "Whether to define this monitor as default";

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

  config = {
    warnings = let
      mainMonitors = filterAttrs (_: val: val.main) cfg.monitors;
      monToList = mapAttrsToList (name: _: name) mainMonitors;
      checkMain = list: (count (i: i != null) list) > 1;
    in
      optionals (checkMain monToList) [
        ''
          Multiple main monitors set. This could lead to a broken configuration in window managers:
          ${concatStringsSep ", " monToList}
        ''
      ];
  };
}
