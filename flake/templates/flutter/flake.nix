# adapted from:
# https://github.com/contrun/nix-flutter-project-template
{
  description = "Flutter template";

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
    inherit (nixpkgs) lib;

    forEachSystem = lib.genAttrs (import systems);

    legacyPackages = forEachSystem (system:
      import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          android_sdk.accept_license = true;
        };
      });
  in {
    packages = forEachSystem (system: {
      default = legacyPackages.${system}.callPackage ./default.nix {};
    });

    devShells = forEachSystem (system: {
      default = legacyPackages.${system}.callPackage ./shell.nix {};
    });
  };
}
