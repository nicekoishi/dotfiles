{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 4;
      gaps_out = 8;
      border_size = 0;
      #"col.active_border" = "0xff94e2d5";
      #"col.inactive_border" = "0xff89dceb";

      # BUG: disabled tearing as my nvidia gpu doesn't go well with it
      # well, it's not like I have a >60Hz monitor anyway
      # allow_tearing = true;
      no_border_on_floating = false;
      apply_sens_to_raw = 0;
    };
  };
}
