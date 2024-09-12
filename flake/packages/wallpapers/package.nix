# based on:
# https://github.com/NotAShelf/wallpkgs/blob/26042f6f5b40581b3303f0e5b963cc25e42351b1/nix/default.nix
{
  stdenvNoCC,
  lib,
  collection ? null,
  ...
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "nicekoishi-wallpapers";
  version = "0.0.2";

  src = ./src;
  strictDeps = true;

  configurePhase = ''
    runHook preConfigure
    mkdir -p $out/share/wallpapers
    runHook postConfigure
  '';

  installPhase = let
    copyCondition =
      if (collection == null)
      then "cp -r ./* $out/share/wallpapers"
      else "cp -r ./${collection}* $out/share/wallpapers";
  in ''
    runHook preInstall
    ${copyCondition}
    runHook postInstall
  '';

  # finalPackage is what we want, this way we can pass each wallpaper
  # directly through this package
  # ex: package.wallpapers.collection.example would return something like
  # /nix/store/123ex.../share/wallpapers/collection/example.png
  passthru.wallpapers = import ./index.nix {inherit lib collection finalAttrs;};

  meta = {
    description = "Collection of packages for personal use";
    license = lib.licenses.gpl3;
    platforms = lib.platforms.all;
    maintainers = ["nicekoishi"];
  };
})
