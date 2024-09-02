{inputs', ...}: let
  wallpaper = ./wallpaper.png;
in {
  services.hyprpaper = {
    enable = true;
    package = inputs'.hyprpaper.packages.hyprpaper;
    settings = {
      ipc = "off";

      splash = false;
      splash_offset = 2.0;

      preload = [
        "${wallpaper}"
      ];

      wallpaper = [
        "HDMI-A-1,${wallpaper}"
      ];
    };
  };

  _module.args.wallpaper = wallpaper;
}
