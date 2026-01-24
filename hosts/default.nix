# it's pratically a copy of this, so I should mention it
# https://github.com/NotAShelf/nyx/blob/d407b4d6e5ab7f60350af61a3d73a62a5e9ac660/hosts/default.nix
{
  inputs,
  withSystem,
  ...
}: let
  inherit (inputs.self) lib;
  inherit (lib.nice) mkNixosSystem mkModuleList;

  # flake inputs
  hm = inputs.home-manager.nixosModules.default;
  #secrets = inputs.agenix.nixosModules.default;

  modulePath = ../modules;
  options = modulePath + "/options";
  system = modulePath + "/system";

  roles = modulePath + "/roles";
  desktop = roles + "/desktop";
in {
  flake.nixosConfigurations = {
    polaris = mkNixosSystem {
      inherit withSystem;
      hostname = "polaris";
      system = "x86_64-linux";

      modules = mkModuleList ./. "polaris" {
        common = [options system];
        roles = [desktop];
        extraModules = [hm];
      };
    };
  };
}
