{
  pkgs,
  lib,
  spicetify-nix,
  inputs,
  ...
}: let
  spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
in {
  # pretty spotify
  # imports = [ inputs.spicetify-nix.homeManagerModule ];

  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.catppuccin-macchiato;
    colorScheme = "teal";

    enabledExtension = with spicePkgs.extensions; [
      adblock
      bookmark
      groupSession
      hidePodcasts
      shuffle
    ];
  };
}
