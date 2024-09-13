{
  config,
  lib,
  ...
}: let
  inherit (lib.attrsets) filterAttrs removeAttrs;
  inherit (lib.options) mkOption;
  inherit (lib.types) bool;

  cfg = config.nice.host.opts;
  usr = config.nice.user;
in {
  options.nice.host.opts = {
    waylandReady = mkOption {
      default = false;
      type = bool;
      internal = true;
      description = ''
        Whether the system has all the necessary requirements to
        run a Wayland compositor.

        This option should be set on your own discretion, as there
        isn't any kind of check to this.

        Severe case of trust me bro.
      '';
    };

    isWayland = mkOption {
      type = bool;
      default = let
        environments = removeAttrs usr.environments ["setup"];
      in
        (filterAttrs (_: env: env ? wayland && env.wayland) environments) != {};
      description = ''
        Whether to enable Wayland exclusive modules.

        This option depends on `config.nice.host.opts.waylandReady`.
        If a Wayland compositor is enabled on the host, enabling this option
        without setting `waylandReady` to true will result in an error
      '';
    };
  };

  config = {
    assertions = [
      {
        assertion = cfg.isWayland -> cfg.waylandReady;
        message = ''
          A Wayland compositor was enabled on `config.nice.user.environments`
          without enabling the required option `config.nice.host.opts.waylandReady`!
        '';
      }
    ];
  };
}
