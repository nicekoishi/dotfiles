{
  self,
  inputs,
  homeImports,
  ...
}: let
  inherit (inputs.nixpkgs.lib) nixosSystem;

  dir = "${self}/modules";

  # roles
  desktop = "${dir}/roles/desktop";

  specialArgs = {inherit inputs self;};
in {
  flake.nixosConfigurations = {
    polaris = nixosSystem {
      inherit specialArgs;

      modules = [
        desktop
        ./polaris

        "${dir}/core/nvidia.nix"

        "${dir}/programs/gaming"
        "${dir}/programs/hyprland"
        "${dir}/programs/steam"
        "${dir}/programs/virt-manager"
        "${dir}/programs/thunar"

        "${dir}/services/system/utilities/gnome"
        "${dir}/services/system/networking/rclone"

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
