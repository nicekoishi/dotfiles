{
  description = "A very cursed flake";

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];

      imports = [
        ./hosts
        ./home/profiles
        ./modules
        ./pkgs
      ];

      perSystem = {pkgs, ...}: {
        devShells.default = pkgs.mkShell {
          DIRENV_LOG_FORMAT = "";
          packages = with pkgs; [
            git

            # nix
            alejandra
            deadnix
            nil
            statix
          ];
        };
      };
    };

  inputs = {
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
    };

    ags = {
      url = "github:Aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    anyrun.url = "github:Kirottu/anyrun";

    arrpc = {
      url = "github:notashelf/arrpc-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hypr-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hypridle.url = "github:hyprwm/hypridle";

    hyprland.url = "github:hyprwm/hyprland";

    neovim-flake = {
      url = "github:NotAShelf/neovim-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";

    nix-index-db = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-gaming.url = "github:fufexan/nix-gaming";

    # nvidia 550 breaks stuff, go back to 535
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nur.url = "github:nix-community/nur";

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify = {
      url = "github:the-argus/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    xdph = {
      url = "github:hyprwm/xdg-desktop-portal-hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
