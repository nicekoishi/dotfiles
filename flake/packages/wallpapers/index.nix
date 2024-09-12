# is this a crime?
{
  lib,
  finalAttrs,
  collection,
}: let
  inherit (lib.attrsets) genAttrs mapAttrs;

  path = finalAttrs.finalPackage;

  mkCollection = {
    name,
    wallpapers,
  }: let
    toGenerate = name:
      if (collection == name || collection == null)
      then wallpapers
      else
        builtins.throw ''
          ${finalAttrs.pname}:
          You tried to access collection ${name}, but this package currently doesn't provide it.
          Please check if you don't have an invalid override.
        '';

    col = genAttrs (toGenerate name) (wal: "/share/wallpapers/${name}/${wal}.png");
  in
    mapAttrs (_: value: path + value) col;

  collections = {
    standard = mkCollection {
      name = "standard";
      wallpapers = [
        "kayoko"
      ];
    };

    nature = mkCollection {
      name = "nature";
      wallpapers = [
        "mountain"
      ];
    };
  };
in
  collections
