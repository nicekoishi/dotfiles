{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";
    anyrun.url = "github:Kirottu/anyrun";
    arrpc.url = "github:notashelf/arrpc-flake";
    hosts.url = "github:StevenBlack/hosts";
  };

  outputs = inputs@{
    nixpkgs,
    hyprland,
    anyrun,
    arrpc,
    hosts,
    self,
    ...}: {
    
    nixpkgs.overlays = [ 
    (import self.inputs.anyrun)
    (import self.inputs.arrpc)
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

