{
  config,
  lib,
  ...
}: let
  inherit (lib.options) mkOption;
  inherit (lib.types) bool;
  inherit (config.nice) host user;
in {
  options.nice.user = {
    apps = {
      gaming = mkOption {
        default = false;
        type = bool;
        description = ''
          Whether to enable application and services needed for games, such as steam and gamemode.
        '';
      };

      media = mkOption {
        default = false;
        type = bool;
        description = ''
          Whether to enable applications for media manipulation and playback controls.
        '';
      };
    };
  };

  config = {
    assertions = [
      # kinda useless, it's here as an example
      {
        assertion = user.apps.gaming -> host.opts.capabilities.video;
        message = ''
          `nice.user.opts.apps.gaming` was enabled on a system without video capabilities.
        '';
      }
    ];
  };
}
