{
  self,
  nixpkgs,
  home-manager,
  hyprland,
<<<<<<< HEAD
=======
  nur,
>>>>>>> 12c72a1 (too lazy to separate them all)
  ...
} @ inputs:
nixpkgs.lib.nixosSystem
{
  system = "x86_64-linux";
  specialArgs = {inherit inputs;};

  modules = [
<<<<<<< HEAD
    ./hardware.nix
=======
>>>>>>> 12c72a1 (too lazy to separate them all)
    ./hardware-configuration.nix
    ./kernel.nix

    ../../environment/hyprland

<<<<<<< HEAD
    ../../packages/pkgs.nix

    "${self}/modules/"

    # common stuff
    home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.nicekoishi = import "${self}/home/profiles/polaris";
      home-manager.extraSpecialArgs = {inherit inputs;};
=======
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
>>>>>>> 12c72a1 (too lazy to separate them all)
    }
    hyprland.nixosModules.default
    {
      programs.hyprland.enable = true;
<<<<<<< HEAD
      programs.hyprland.nvidiaPatches = true;
=======
>>>>>>> 12c72a1 (too lazy to separate them all)
    }
  ];
}
