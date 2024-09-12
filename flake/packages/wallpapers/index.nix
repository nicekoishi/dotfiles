# TODO: Index by category i.e put each wallpaper on its own category
# like anime, landscape, etc.
# is this a crime?
{
  lib,
  finalAttrs,
}: let
  inherit (lib.attrsets) genAttrs mapAttrs;
  index = genAttrs wallpapers (name: "/share/wallpapers/${name}.png");
  path = finalAttrs.finalPackage;

  wallpapers = [
    "kayoko"
  ];
in
  mapAttrs (_: value: path + value) index
