{
  wayland.windowManager.hyprland.settings = {
    decoration = {
      rounding = 12;
      drop_shadow = true;
      shadow_ignore_window = true;
      shadow_offset = "1 2";
      shadow_range = 10;
      shadow_render_power = 3;
      "col.shadow" = "rgba(292c3cee)";

      blur = {
        enabled = true;
        passes = 3;
        size = 5;
        brightness = 0.82;
        contrast = 0.71;
        ignore_opacity = true;
        new_optimizations = true;
        special = true;
        vibrancy = 0.2;
        xray = true;
      };
    };

    animations = {
      enabled = true;

      bezier = [
        "overshot, 0.05, 0.9, 0.1, 1.05"
        "smoothOut, 0.36, 0, 0.66, -0.56"
        "smoothIn, 0.25, 1, 0.5, 1"
      ];

      animation = [
        "windows, 1, 5, overshot, slide"
        "windowsOut, 1, 4, smoothOut, slide"
        "windowsMove, 1, 4, default"

        "border, 1, 10, default"
        "borderangle, 1, 8, default"

        "fade, 1, 10, smoothIn"
        "fadeDim, 1, 10, smoothIn"
        "workspaces, 1, 4, overshot, slidevert"
      ];
    };
  };
}
