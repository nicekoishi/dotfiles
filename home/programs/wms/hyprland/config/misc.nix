{
  wayland.windowManager.hyprland.settings = {
    misc = {
      disable_autoreload = true;
      disable_hyprland_logo = true;
      disable_splash_rendering = true;

      mouse_move_enables_dpms = true;
      key_press_enables_dpms = true;

      enable_swallow = true;
      swallow_regex = "kitty|footclient|Alacritty";

      # for some reason it was set to false
      vfr = true;
    };
  };
}
