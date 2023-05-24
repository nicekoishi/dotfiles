{ pkgs, inputs, ...}:
let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in
{
  # pretty spotify
  imports = [ inputs.spicetify-nix.homeManagerModule ];

  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.catppuccin-macchiato;
    colorScheme = "teal";

    enabledExtensions = with spicePkgs.extensions; [
      adblock
      bookmark
      groupSession
      hidePodcasts
      shuffle
    ];
  };
}
