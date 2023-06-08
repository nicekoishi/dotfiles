{
  self,
  nixpkgs,
  home-manager,
  hyprland,
  ...
} @ inputs:
nixpkgs.lib.nixosSystem
{
  system = "x86_64-linux";
  specialArgs = {inherit inputs;};

  modules = [
    ./hardware.nix
    ./hardware-configuration.nix
    ./kernel.nix

    ../../environment/hyprland

    ../../packages/pkgs.nix

    "${self}/modules/"

    # common stuff
    home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.nicekoishi = import "${self}/home/profiles/polaris";
      home-manager.extraSpecialArgs = {inherit inputs;};
    }
    hyprland.nixosModules.default
    {
      programs.hyprland.enable = true;
      programs.hyprland.nvidiaPatches = true;
    }
  ];
}
