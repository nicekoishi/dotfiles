{
  imports = [
    ./args.nix
    #    ./docs.nix

    # TODO: Start using pre-commit
    # ./fmt.nix

    ./shell.nix

    ./lib
    ./modules
    ./packages
    ./templates
  ];
}
