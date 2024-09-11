{inputs, ...}: {
  imports = [
    ./args.nix
    ./fmt.nix
    ./pkgs.nix
    ./shell.nix

    ./lib
    ./modules
    ./templates

    inputs.treefmt-nix.flakeModule
  ];
}
