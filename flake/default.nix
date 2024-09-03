{inputs, ...}: {
  imports = [
    ./args.nix
    ./fmt.nix
    ./shell.nix

    ./lib
    ./modules
    ./pkgs
    ./templates

    inputs.treefmt-nix.flakeModule
  ];
}
