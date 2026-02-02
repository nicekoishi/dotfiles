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

          description = "Samsung Electric Company Odyssey G30B HX5XA03495";

          wallpaper = ./plana.jpg;
        };
      };
    };

    apps = {
      gaming = true;
    };
  };
}
