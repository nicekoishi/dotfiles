{
  inputs,
  inputs',
  ...
}: let
  spicetify = inputs'.spicetify.legacyPackages;
in {
  imports = [inputs.spicetify.homeManagerModules.default];

  programs.spicetify = {
    enable = true;
    windowManagerPatch = true;
    spotifyLaunchFlags = "--disable-gpu";

    theme = spicetify.themes.catppuccin;
    colorScheme = "mocha";

    enabledExtensions = with spicetify.extensions; [
      adblock
      shuffle
      fullAppDisplay
      groupSession
      volumePercentage
    ];

    enabledCustomApps = with spicetify.apps; [
      localFiles
    ];
  };
}
