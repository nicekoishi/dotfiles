{
  config,
  lib,
  ...
}: let
  inherit (lib.options) mkEnableOption mkOption;
  inherit (lib.types) str;

  cfg = config.nice.user;
in {
  imports = [
    ./desktop
    ./style

    ./apps.nix
    ./display.nix
  ];

  options.nice.user = {
    main = mkOption {
      default = "supeen";
      type = str;
      description = ''
        The username of the main user of the system.
      '';
    };

    home-manager.enable = mkEnableOption "home-manager, to manage a user environment using Nix.";
  };

  config = {
    assertions = [
      {
        assertion = cfg.home-manager.enable -> cfg.main != "";
        message = ''
          `config.nice.user.main` must be set while `config.nice.user.home-manager.enable` is enabled!
        '';
      }
    ];
  };
}
