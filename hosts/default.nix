{
  self,
  inputs,
  hmConfig,
  desktop,
  ...
}: {
  flake.nixosConfigurations = let
    inherit (inputs.nixpkgs.lib) nixosSystem;
    dir = "${self}/modules";
    specialArgs = {inherit inputs self;};
  in {
    polaris = nixosSystem {
      inherit specialArgs;

      modules =
        desktop
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
              users.supeen.imports = hmConfig."polaris";
              extraSpecialArgs = specialArgs;
            };
          }
        ];
    };
  };
}
