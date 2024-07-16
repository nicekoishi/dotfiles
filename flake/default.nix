{inputs, ...}: {
  imports = [
    ./args.nix
    ./fmt.nix
    ./shell.nix

    ./lib
    ./modules
    ./pkgs

    inputs.treefmt-nix.flakeModule
  ];
}
