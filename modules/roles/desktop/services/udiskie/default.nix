{
  config,
  inputs,
  lib,
  ...
}: let
  inherit (builtins) elem;
  inherit (inputs) home-manager;
  inherit (lib.modules) mkIf;

  cfg = config.nice.host;
in {
  imports = [home-manager.nixosModules.default];

  config = mkIf (elem "desktop" cfg.roles) {
    services.udisks2.enable = true;
    home-manager.users.supeen = {
      services.udiskie.enable = true;
    };
  };
}
