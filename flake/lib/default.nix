{inputs, ...}: let
  inherit (inputs.nixpkgs) lib;

  # https://github.com/NotAShelf/nvf/blob/main/lib/default.nix
  # https://github.com/NotAShelf/nvf/blob/main/lib/stdlib-extended.nix
  # NOTE: this way looks cleaner, making it possible to import everything under a separate namespace
  # it does adds a few more layers, but nothing that inherit can't fix
  importedLibs = {
    builders = import ./builders.nix {inherit inputs lib;};

    # NOTE: forgot where I saw it, but if an attrset is explicitly named you can do this
    # this is just to make the functions available under lib.nice instead
    inherit (importedLibs.builders) mkNixosSystem;
  };

  extendedLib = lib.extend (_: _: {
    nice = {} // importedLibs;
  });
in {
  perSystem = {
    _module.args.lib = extendedLib;
  };

  flake.lib = extendedLib;
}
