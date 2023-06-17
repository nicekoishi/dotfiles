{
  inputs,
  pkgs,
  ...
}: let
  aagl = inputs.aagl.packages.${pkgs.system};
in {
  # I want my cake and eat it too, so the telemetry blocking is done at modules/telemetry.nix
  home.packages = [
    inputs.aagl-fork.packages.${pkgs.system}.anime-borb-launcher
    aagl.honkers-railway-launcher
    aagl.anime-game-launcher
  ];
}
