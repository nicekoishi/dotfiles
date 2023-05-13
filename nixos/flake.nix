{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    anyrun.url = "github:Kirottu/anyrun";
    emacs-overlay.url = "github:nix-community/emacs-overlay/1e922fda2d7f6e29844ea215b7e4e110ba6ee4bf";
    hosts.url = "github:StevenBlack/hosts";
  };

  outputs = inputs@{
    nixpkgs,
    hyprland,
    anyrun,
    emacs-overlay,
    hosts,
    self,
    ...}: {
    
    nixpkgs.overlays = [ 
    (import self.inputs.anyrun)
    (import self.inputs.emacs-overlay)
    ];

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

