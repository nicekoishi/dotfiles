{
  inputs,
  inputs',
  ...
}: let
  spicePkgs = inputs'.spicetify.legacyPackages;
in {
  imports = [
    inputs.spicetify.homeManagerModules.spicetify
  ];

  programs.spicetify = {
    enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
      shuffle
    ];
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
  };
}
