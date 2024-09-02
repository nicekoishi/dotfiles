{
  inputs,
  withSystem,
  ...
}: let
  inherit (inputs.self) lib;
  inherit (lib.nice) mkNixosSystem mkNixosIso mkModulesFor;

  mkModulesFor' = mkModulesFor ./. [secrets system options];

  hm = inputs.home-manager.nixosModules.default;
  secrets = inputs.agenix.nixosModules.default;

  # core modules definition
  modulePath = ../modules;
  system = modulePath + "/system";
  options = modulePath + "/options";

  # roles definition, each containing its own set of configs/overrides
  roles = modulePath + "/roles";
  desktop = [(roles + "/desktop") hm];

  # the heck?
  mkNixosSystem' = args:
    mkNixosSystem (args // {hosts = ./.;});
in {
  flake.nixosConfigurations = {
    polaris = mkNixosSystem' {
      inherit withSystem;
      hostname = "polaris";
      system = "x86_64-linux";

      modules = mkModulesFor' "polaris" [
        desktop
        inputs.chaotic.nixosModules.default
      ];
    };
  };
}
