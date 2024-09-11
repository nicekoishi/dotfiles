{
  inputs',
  lib,
  osConfig,
  ...
}: let
  inherit (lib.attrsets) mapAttrsToList;
  inherit (lib.strings) concatStringsSep;
  inherit (usr.display) monitors;

  usr = osConfig.nice.modules.user;
in {
  services.hyprpaper = {
    enable = true;
    package = inputs'.hyprpaper.packages.hyprpaper;
    settings = {
      ipc = "off";

      splash = false;
      splash_offset = 2.0;

      # would this be bad with a lot of monitors? probably not
      preload = mapAttrsToList (_: opts: opts.wallpaper) monitors;

      wallpaper = mapAttrsToList (name: opts:
        concatStringsSep "," [name opts.wallpaper])
      monitors;
    };
  };
}
