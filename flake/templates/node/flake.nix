# based on:
# https://github.com/NotAShelf/nyx/tree/d407b4d6e5ab7f60350af61a3d73a62a5e9ac660/parts/templates/node
{
  description = "NodeJS template";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";

    # https://github.com/nix-systems/nix-systems
    systems.url = "github:nix-systems/default-linux";
  };

  outputs = {
    nixpkgs,
    systems,
    ...
  }: let
    inherit (nixpkgs) legacyPackages lib;
    forEachSystem = lib.genAttrs (import systems);
  in {
    packages = forEachSystem (system: {
      default = legacyPackages.${system}.callPackage ./default.nix {};
    });

    devShells = forEachSystem (system: {
      default = legacyPackages.${system}.callPackage ./shell.nix {};
    });
  };
}
