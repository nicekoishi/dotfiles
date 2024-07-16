{inputs, ...}: let
  inherit (inputs.nixpkgs) lib;
  inherit (lib) foldl recursiveUpdate;

  builders = import ./builders.nix {inherit inputs lib;};

  importedLibs = [builders];
  extendedLib = lib.extend (_: _: foldl recursiveUpdate {} importedLibs);
in {
  perSystem = {
    _module.args.lib = extendedLib;
  };

  flake.lib = extendedLib;
}
