{
  inputs,
  withSystem,
  ...
}: let
  inherit (inputs.self) lib;

  inherit (lib.lists) flatten map;
  inherit (lib.nice) mkNixosSystem;

  # what the... Maybe I'm looking at this the wrong way, but is there a better way to get path of
  # where a function is called, or it will always default to where the function is defined?
  mkNixosSystem' = args: mkNixosSystem (args // {hosts = ./.;});
  modulePath = ../modules;

  # it doesn't return a proper path if it isn't in parentheses
  # https://nixos.wiki/wiki/Nix_Language:_Tips_%26_Tricks
  core = map (path: modulePath + ("/" + path)) ["core" "nix" "system"];

  desktop = flatten [core (modulePath + "/roles/desktop")];
in {
  flake.nixosConfigurations = {
    polaris = mkNixosSystem' {
      inherit withSystem;
      hostname = "polaris";
      system = "x86_64-linux";

      modules = [
        "${modulePath}/system/hardware/video/nvidia"
        desktop

        inputs.chaotic.nixosModules.default
      ];
    };
  };
}
