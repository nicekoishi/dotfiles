# based on:
# https://github.com/NotAShelf/wallpkgs/blob/26042f6f5b40581b3303f0e5b963cc25e42351b1/nix/default.nix
# NOTE: Would content-adressed nix help implement out in passthru?
# This would allow using the derivation itself in a wallpaper option, for example:
#   wallpaper = package.example
# It works on repl, but placeholder "out" isn't reliable at all, making the resulting string a mess
{
  stdenvNoCC,
  lib,
  wallpaper ? null,
  ...
}:
stdenvNoCC.mkDerivation {
  pname = "nicekoishi-wallpapers";
  version = "0.0.1";

  src = ./src;
  strictDeps = true;

  configurePhase = ''
    runHook preConfigure
    mkdir -p $out/share/wallpapers
    runHook postConfigure
  '';

  installPhase = let
    copyCondition =
      if (wallpaper == null)
      then "cp -r ./* $out/share/wallpapers"
      else "cp -r ./${wallpaper}* $out/share/wallpapers";
  in ''
    runHook preInstall
    ${copyCondition}
    runHook postInstall
  '';

  meta = {
    description = "Collection of packages for personal use";
    license = lib.licenses.gpl3;
    platforms = lib.platforms.linux;
    maintainers = ["nicekoishi"];
  };
}
