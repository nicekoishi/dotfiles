{
  config,
  lib,
  ...
}: let
  inherit (lib.attrsets) filterAttrs removeAttrs;
  inherit (lib.options) mkOption;
  inherit (lib.types) bool enum listOf;

  cfg = config.nice.host.opts;
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

  config = {
    assertions = [
      {
        assertion = cfg.isWayland -> cfg.waylandReady;
        message = ''
          A Wayland compositor was enabled on `config.nice.user.desktop`
          without enabling the required option `config.nice.host.opts.waylandReady`!
        '';
      }
    ];
  };
}
