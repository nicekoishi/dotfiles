{
  self,
  nixpkgs,
  home-manager,
  hyprland,
  nur,
  ...
} @ inputs:
nixpkgs.lib.nixosSystem
{
  system = "x86_64-linux";
  specialArgs = {inherit inputs;};

  modules = [
    ./hardware-configuration.nix
    ./kernel.nix

    ../../environment/hyprland

    "${self}/modules/"

    nur.nixosModules.nur
    ({config, ...}: {
      environment.systemPackages = [config.nur.repos.ataraxiasjel.waydroid-script];
    })

    home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users.supeen = import "${self}/home/profiles/polaris";
        extraSpecialArgs = {inherit inputs;};
      };
    }
    hyprland.nixosModules.default
    {
      programs.hyprland.enable = true;
    }
  ];
}
