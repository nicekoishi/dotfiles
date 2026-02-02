{
  config,
  lib,
  ...
}: let
  inherit (lib.attrsets) filterAttrs removeAttrs;
  inherit (lib.options) mkOption;
  inherit (lib.types) bool enum listOf;
  inherit (cfg) opts;

  cfg = config.nice.host;
  usr = config.nice.user;
in {
  options.nice.host.opts = {
    roles = mkOption {
      default = [];
      type = listOf (enum ["desktop" "laptop" "iso"]);
      description = ''
        A list of all roles enabled for this host.

        The main purpose of this option is to not polute `system.nixos.tags`,
        as we may be dealing with way more roles in the future.
      '';
    };

    profiles = mkOption {
      default = [];
      type = listOf (enum ["gaming" "server"]);
      description = ''
        A list of all profiles enabled for this host.

        The main purpose of this option is to not polute `system.nixos.tags`,
        as we may be dealing with way more profiles in the future.
      '';
    };

    capabilities = {
      audio = mkOption {
        default = false;
        type = bool;
        description = ''
          Whether the system is capable of playing audio.

          This option enables pipewire, our sound server.
        '';
      };

      video = mkOption {
        default = cfg.gpu != [];
        type = bool;
        description = ''
          Whether the system requires a video driver for graphics or other applications.

          When not specifying a driver in `config.nice.host.gpu`, this option will default to false
        '';
      };

      waylandReady = mkOption {
        default = false;
        type = bool;
        description = ''
          Whether the system has all the necessary requirements to
          run a Wayland compositor.

          This option should be set on your own discretion, as there
          isn't any kind of check to this.

          Trust me bro.
        '';
      };
    };

    state = {
      isWayland = mkOption {
        type = bool;
        readOnly = true;
        default = let
          desktop = removeAttrs usr.desktop ["setup"];
        in
          (filterAttrs (_: env: env ? wayland && env.enable) desktop) != {};
        description = ''
          Whether to enable Wayland exclusive modules.

          This option depends on `config.nice.host.opts.waylandReady` and is
          set automatically if a Wayland compositor is enabled on
          `config.nice.user.desktop`.

          Enabling a Wayland compositor without enabling `waylandReady` **will**
          result in an error!
        '';
      };
    };
  };

  config = {
    assertions = [
      {
        assertion = opts.state.isWayland -> opts.capabilities.waylandReady;
        message = ''
          A Wayland compositor was enabled on `config.nice.user.desktop`
          without enabling the required option `config.nice.host.opts.waylandReady`!
        '';
      }
    ];
  };
}
