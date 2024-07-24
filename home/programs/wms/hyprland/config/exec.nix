{config, ...}: {
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "hyprctl setcursor ${config.home.pointerCursor.name} ${toString config.home.pointerCursor.size}"
    ];
  };
}
