# it's pratically a copy of this, so I should mention it
# https://github.com/NotAShelf/nyx/blob/d407b4d6e5ab7f60350af61a3d73a62a5e9ac660/hosts/default.nix
{
  inputs,
  withSystem,
  ...
}: let
  inherit (inputs.self) lib;
  inherit (lib.attrsets) optionalAttrs;
  inherit (lib.nice) mkNixosSystem mkModuleList;

  # Pass the current path and a list of common modules for all hosts
  # These common options will not be set if common is already set inside the function
  # This can be useful if we want a host without these options, for example... an ISO
  # Though common needs to have at least secrets in it or some services may fail to start
  mkModuleList' = hostname: attr:
    mkModuleList ./. hostname
    (attr // optionalAttrs (!attr ? common) {common = [options system secrets];});

  # flake inputs
  hm = inputs.home-manager.nixosModules.default;
  secrets = inputs.agenix.nixosModules.default;

  # core modules definition
  modulePath = ../modules;
  system = modulePath + "/system";
  options = modulePath + "/options";

  # roles definition, each containing its own set of configs/overrides
  roles = modulePath + "/roles";
  desktop = roles + "/desktop";

  # profiles i.e they don't override or setup enough to be considered a role
  profiles = modulePath + "/profiles";
  gaming = profiles + "/gaming";
  server = profiles + "/server";
in {
  flake.nixosConfigurations = {
    polaris = mkNixosSystem {
      inherit withSystem;
      hostname = "polaris";
      system = "x86_64-linux";

      modules = mkModuleList' "polaris" {
        roles = [desktop];
        profiles = [
        gaming
        # server
        ];
        extraModules = [hm];
      };
    };
  };
}
