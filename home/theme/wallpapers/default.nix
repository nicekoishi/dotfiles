{
  lib,
  pkgs,
  ...
}: let
  inherit (lib.strings) concatStringsSep;
  inherit (lib.attrsets) mapAttrsToList;

  configuration = {
    SWWW_TRANSITION = "any";
    SWWW_TRANSITION_DURATION = 2;
    SWWW_TRANSITION_FPS = 60;
    SWWW_TRANSITION_BEZIER = "0.05,0.9,0.1,1.05";
  };

  vars = concatStringsSep "\n" (mapAttrsToList (key: value: ''
      export ${key}="${toString value}"
    '')
    configuration);

  wall-dark = pkgs.writeShellApplication {
    name = "wall-dark";
    runtimeInputs = with pkgs; [swww];
    text = ''
      ${vars}
      swww img ${./dark.png}
      cp -f ${./dark.png} /tmp/current-wall.png
    '';
  };

  wall-light = pkgs.writeShellApplication {
    name = "wall-light";
    runtimeInputs = with pkgs; [swww];
    text = ''
      ${vars}
      swww img ${./light.png}
      cp -f ${./light.png} /tmp/current-wall.png
    '';
  };
in {
  services.darkman = {
    darkModeScripts = {wallpaper = lib.getExe wall-dark;};
    lightModeScripts = {wallpaper = lib.getExe wall-light;};
  };
}
