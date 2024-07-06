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

        "${dir}/programs/desktop/hyprland"
        "${dir}/programs/desktop/gnome"

        "${dir}/programs/gaming"
        "${dir}/programs/virt-manager"
        "${dir}/programs/thunar"

        "${dir}/services/system/utilities/gnome"
        "${dir}/services/system/networking/tailscale"

        inputs.chaotic.nixosModules.default
        inputs.nur.nixosModules.nur

        {
          home-manager = {
            users.supeen.imports = homeImports."supeen";
            extraSpecialArgs = specialArgs;
          };
        }
      ];
    };
  };
}
