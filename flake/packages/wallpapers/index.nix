# is this a crime?
{
  lib,
  hash,
}: let
  inherit (lib.attrsets) genAttrs mapAttrs;
  index = genAttrs wallpapers (name: "/share/wallpapers/${name}.png");

  wallpapers = [
    "kayoko"
  ];
in
  mapAttrs (_: value: "/nix/store" + hash + value) index
