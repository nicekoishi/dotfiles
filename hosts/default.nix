{
  self,
  inputs,
  homeImports,
  roles,
  ...
}: let
  inherit (inputs.nixpkgs.lib) nixosSystem;

  dir = "${self}/modules";

  specialArgs = {inherit inputs self;};
in {
  flake.nixosConfigurations = {
    polaris = nixosSystem {
      inherit specialArgs;

      modules =
        roles."desktop"
        ++ [
          ./polaris

          "${dir}/core/nvidia.nix"

          "${dir}/programs/gaming"
          "${dir}/programs/hyprland.nix"
          "${dir}/programs/steam.nix"
          "${dir}/programs/virt-manager.nix"
          "${dir}/programs/thunar.nix"

          "${dir}/services/system/gnome.nix"
          "${dir}/services/system/rclone.nix"

          inputs.chaotic.nixosModules.default

          {
            home-manager = {
              users.supeen.imports = homeImports."polaris";
              extraSpecialArgs = specialArgs;
            };
          }
        ];
    };
  };
}
