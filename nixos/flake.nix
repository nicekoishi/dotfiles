{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    anyrun.url = "github:Kirottu/anyrun";
    hosts.url = "github:StevenBlack/hosts";
  };

  outputs = inputs@{
    nixpkgs,
    hyprland,
    anyrun,
    hosts,
    self,
    ...}: {
    
    nixpkgs.overlays = [ (import self.inputs.anyrun) ];

    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        modules = [
          ./configuration.nix

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
	specialArgs.inputs = inputs;
      };
    };
  };
}

