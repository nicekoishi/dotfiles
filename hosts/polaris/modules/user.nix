{
  nice.user = {
    desktop.setup = ["Hyprland"];
    home-manager.enable = true;

    display = {
      main = "DP-1";

      monitors = {
        "DP-1" = {
          width = 1920;
          height = 1080;
          refreshRate = 144;

          # wallpaper = kayoko;
        };
      };
    };
  };
}
