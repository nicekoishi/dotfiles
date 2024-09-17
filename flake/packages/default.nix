{
  perSystem = {
    lib,
    pkgs,
    ...
  }: let
    inherit (lib.attrsets) removeAttrs;
    inherit (lib.filesystem) packagesFromDirectoryRecursive;
  in {
    packages = removeAttrs (packagesFromDirectoryRecursive {
      inherit (pkgs) callPackage;
      directory = ./.;
    }) ["default"];
  };
}
