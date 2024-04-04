{
  inputs,
  pkgs,
  ...
}: let
  inherit (inputs) spicetify;
  spice = spicetify.packages."${pkgs.system}".default;
in {
  imports = [spicetify.homeManagerModule];

  programs.spicetify = {
    enable = true;
    theme = spice.themes.catppuccin;
    colorScheme = "mocha";

    enabledExtensions = with spice.extensions; [
      adblock
      shuffle
      volumePercentage
    ];
  };
}
