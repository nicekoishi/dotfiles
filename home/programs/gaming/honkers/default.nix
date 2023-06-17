{
  inputs,
  pkgs,
  ...
}: let
  aagl = inputs.aagl.packages.${pkgs.system};
in {
  # I want my cake and eat it too, so the telemetry blocking is done at modules/telemetry.nix
  home.packages = [
    aagl.honkers-railway-launcher
    aagl.anime-game-launcher
  ];
}
