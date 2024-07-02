{inputs, ...}: {
  imports = [
    ./args.nix
    ./fmt.nix
    ./shell.nix

    ./modules
    ./pkgs

    inputs.treefmt-nix.flakeModule
  ];
}
