{ pkgs, inputs, ...}:

{
  # themable spotify
  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.packages.${pkgs.hostPlatform.system}.default;
  in {
    enable = true;

    spotifyPackage = pkgs.spotify;

    theme = spicePkgs.themes.catppuccin-macchiato;

    colorScheme = "teal";

    enabledExtensions = with spicePkgs.extensions; [
      adblock
      fullAppDisplay
      hidePodcasts
      shuffle
    ];
  };
}
