{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    hyprland.url = "github:hyprwm/Hyprland";

    anyrun= {
      url = "github:Kirottu/anyrun";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    arrpc = {
      url = "github:notashelf/arrpc-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hosts = {
      url = "github:StevenBlack/hosts";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:the-argus/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{
    nixpkgs,
    hyprland,
    spicetify-nix,
    anyrun,
    arrpc,
    hosts,
    ...}: {

    nixosConfigurations = {
      polaris = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/polaris
          ./nixos/environment/hyprland

	        hosts.nixosModule
	        {
            networking.stevenBlackHosts = {
              blockGambling = true;
	            blockPorn = true;
	          };
	        }

          hyprland.nixosModules.default
          {
            programs.hyprland.enable = true;
            programs.hyprland.nvidiaPatches = true;
          }
          #...
        ];

        specialArgs = {inherit inputs;};
      };
    };
  };
}

