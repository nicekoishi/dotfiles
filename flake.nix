{
  description = "The most cursed flake you'll ever see (i guess)";
  outputs = inputs@{ self
  , anyrun
  , arrpc
  , home-manager
  , hyprland
  , nixpkgs
  , spicetify-nix
  , ...}: {

    nixosConfigurations = {
      polaris = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/polaris
          ./nixos/environment/hyprland

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.nicekoishi = import ./nixos/users/home.nix;
          }
          #...
        ];

        specialArgs = {inherit inputs;};
      };
    };
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    anyrun= {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    arrpc = {
      url = "github:notashelf/arrpc-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      url = "github:hyprwm/hyprland";
      #inputs.nixpkgs.follows = "nixpkgs"; dont do this, it will make the cache useless
    };

    spicetify-nix = {
      url = "github:the-argus/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

}

