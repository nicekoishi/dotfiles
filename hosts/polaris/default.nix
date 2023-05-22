{ self, nixpkgs, home-manager, hyprland, ... }@inputs: nixpkgs.lib.nixosSystem

{
  system = "x86_64-linux";
  specialArgs = {inherit inputs;};
  modules = [
    ./hardware.nix
    ./hardware-configuration.nix
    ./kernel.nix

    ../../environment/hyprland

    # BUG: User is not imported at environment/hyprland, so I import it here
    ../../home/users/nicekoishi.nix
    ../../packages/pkgs.nix

    "${self}/modules/common"
    home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.nicekoishi = import "${self}/home/users";
    }
    hyprland.nixosModules.default
    {
      programs.hyprland.enable = true;
      programs.hyprland.nvidiaPatches = true;
    }
  ];
}
