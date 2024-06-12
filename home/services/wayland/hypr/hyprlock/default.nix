{wallpaper, ...}: {
  programs.hyprlock = let
    font_family = "Iosevka Nerd Font Propo";
  in {
    enable = true;

    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
        no_fade_in = true;
      };

      background = [
        {
          monitor = "";
          # use ffmpeg -i input.png -b 8M output.png before,
          # hyprlock hyprlocking
          path = "${wallpaper}";
          color = "rgb(30, 30, 46)";
          blur_passes = 3;
          blur_size = 8;
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "300, 50";
          outline_thickness = 2;

          outer_color = "rgb(30, 30, 46)";
          inner_color = "rgb(69, 71, 90)";
          font_color = "rgb(205, 214, 244)";

          fade_on_empty = false;

          dots_spacing = 0.3;
          dots_center = true;
        }
      ];

      label = [
        {
          monitor = "";
          text = "$TIME";
          inherit font_family;
          font_size = 75;
          color = "rgb(205, 214, 244)";

          position = "0, 80";

          valign = "center";
          halign = "center";
        }
      ];
    };
  };
}
