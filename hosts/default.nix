{
  inputs,
  withSystem,
  ...
}: let
  inherit (inputs.self) lib;
  inherit (lib.nice) mkNixosSystem;

  # core modules definition
  modulePath = ../modules;
  system = modulePath + "/system";
  options = modulePath + "/options";

  # roles definition, each containing its own set of configs/overrides
  roles = modulePath + "/roles";
  desktop = roles + "/desktop";
  gaming = roles + "/gaming";

  # the heck?
  mkNixosSystem' = args:
    mkNixosSystem (args
      // {
        hosts = ./.;
        modules = args.modules ++ [system options];
      });
in {
  flake.nixosConfigurations = {
    polaris = mkNixosSystem' {
      inherit withSystem;
      hostname = "polaris";
      system = "x86_64-linux";

      modules = [
        desktop
        gaming
        inputs.chaotic.nixosModules.default
      ];
    };
  };
}
