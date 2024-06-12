{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "off";

      splash = false;
      splash_offset = 2.0;

      preload = [
        "${./dark.png}"
      ];

      wallpaper = [
        "HDMI-A-1,${./dark.png}"
      ];
    };
  };
}
