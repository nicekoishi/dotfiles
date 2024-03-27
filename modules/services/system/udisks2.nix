{inputs, ...}: let
  inherit (inputs) home-manager;
in {
  imports = [home-manager.nixosModules.default];

  services.udisks2.enable = true;
  home-manager.users.supeen = {
    services.udiskie.enable = true;
  };
}
