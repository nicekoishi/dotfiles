{
  inputs,
  pkgs,
  ...
}: let
  aagl = inputs.aagl.packages.${pkgs.system};
in {
  home.packages = [
    aagl.honkers-railway-launcher
    aagl.anime-game-launcher
  ];
}
