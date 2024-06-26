{
  inputs,
  lib,
  pkgs,
  self,
  ...
}: let
  inherit (inputs) spicetify;
  spice = spicetify.packages."${pkgs.system}".default;
in {
  imports = [spicetify.homeManagerModule];

  # webcord crashes on the login menu but it works
  # spotify is lazy i guess
  xdg.desktopEntries."spotify" = lib.mkForce {
    name = "Spotify";
    type = "Application";
    mimeType = ["x-scheme-handler/spotify"];
    icon = "spotify-client";
    exec = "spotify --disable-gpu %U";
    categories = ["Audio"];
    terminal = false;
  };

  programs.spicetify = {
    enable = true;
    windowManagerPatch = true;
    overwriteAssets = true;
    sidebarConfig = true;

    injectCss = true;
    replaceColors = true;
    theme = spice.themes.catppuccin;
    colorScheme = "mocha";

    enabledExtensions = with spice.extensions; [
      adblock
      shuffle
      fullAppDisplay
      groupSession
      volumePercentage
    ];
  };
}
