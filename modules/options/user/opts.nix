{
  config,
  lib,
  ...
}: let
  inherit (lib.attrsets) filterAttrs mapAttrsToList;
  inherit (lib.lists) count optionals;
  inherit (lib.options) mkEnableOption mkOption;
  inherit (lib.strings) concatStringsSep;
  inherit (lib.types) attrsOf int submodule;

  cfg = config.nice.user;
in {
  options.nice.user = {
    home-manager =
      mkEnableOption ""
      // {
        description = "Manage a user environment using Nix";
      };

    # adapted from vimjoyer's video:
    # https://www.youtube.com/watch?v=EUiXzX7nthY&t=200s
    monitors = mkOption {
      default = {};
      type = attrsOf (submodule {
        options = {
          main =
            mkEnableOption ""
            // {
              description = "Whether to define this monitor as default";
            };

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

          # TODO: if not specified, this will definitely cause a conflict
          # can an assertion help here? or just don't be stupid?
          pos = {
            x = mkOption {
              type = int;
              default = 0;
            };

            y = mkOption {
              type = int;
              default = 0;
            };
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
