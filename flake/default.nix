{inputs, ...}: {
  imports = [
    ./args.nix
    ./docs.nix
    ./fmt.nix
    ./shell.nix

    ./lib
    ./modules
    ./packages
    ./templates

    inputs.treefmt-nix.flakeModule
  ];
}
