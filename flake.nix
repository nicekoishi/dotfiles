{
  description = "The most cursed flake you'll ever see (i guess)";
  outputs = inputs: {
    nixosConfigurations = {
      polaris = import ./hosts/polaris inputs;
    };
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    hyprland.url = "github:hyprwm/hyprland/51a930f802c71a0e67f05e7b176ded74e8e95f87";

    nix-gaming.url = "github:fufexan/nix-gaming";

    anyrun = {
      url = "github:Kirottu/anyrun/55647caaab6ed28c072dfd4613b56822426281b6";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    arrpc = {
      url = "github:notashelf/arrpc-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hypr-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-flake = {
      url = "github:NotAShelf/neovim-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:the-argus/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
