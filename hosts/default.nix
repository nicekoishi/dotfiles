{
  self,
  inputs,
  ...
}: let
  inherit (inputs.nixpkgs) lib;

  dir = "${self}/modules";

  # roles
  core = [
    "${dir}/core"
    "${dir}/nix"
    "${dir}/services"
  ];

  desktop = ["${dir}/roles/desktop"] ++ core;

  specialArgs = {inherit inputs self;};
in {
  flake.nixosConfigurations = {
    polaris = lib.nixosSystem {
      inherit specialArgs;

      modules =
        [
          ./polaris

          "${dir}/core/nvidia.nix"

          "${dir}/programs/desktop/hyprland"
          "${dir}/programs/desktop/gnome"

          "${dir}/programs/gaming"
          "${dir}/programs/virt-manager"
          "${dir}/programs/thunar"

          inputs.chaotic.nixosModules.default
          inputs.nur.nixosModules.nur
        ]
        ++ desktop;
    };
  };
}
