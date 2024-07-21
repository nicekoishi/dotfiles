{
  inputs,
  withSystem,
  ...
}: let
  inherit (inputs.self) lib;

  inherit (lib.lists) concatLists flatten map;
  inherit (lib.nice) mkNixosSystem;

  modulePath = ../modules;

  # it doesn't return a proper path if it isn't in parentheses
  # https://nixos.wiki/wiki/Nix_Language:_Tips_%26_Tricks
  core = map (path: modulePath + ("/" + path)) ["core" "nix" "system"];

  desktop = flatten [core (modulePath + "/roles/desktop")];
in {
  flake.nixosConfigurations = {
    polaris = mkNixosSystem {
      inherit withSystem;
      hostname = "polaris";
      system = "x86_64-linux";

      modules = concatLists [
        [
          "${modulePath}/system/hardware/video/nvidia"
          ./polaris
          desktop
        ]
        [
          inputs.chaotic.nixosModules.default
          inputs.nur.nixosModules.nur
        ]
      ];
    };
  };
}
