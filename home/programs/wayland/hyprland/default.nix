{
  config,
  inputs,
  ...
}: {
  imports = [
    inputs.hyprland.homeManagerModules.default
    ./config
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemd = {
      enable = true;
      variables = ["--all"];
    };

    settings = {
      "$mod" = "SUPER";
      monitor = [", 1920x1080, 0x0, 1"];

      exec-once = [
        # pls rember
        "hyprctl setcursor ${config.home.pointerCursor.name} ${toString config.home.pointerCursor.size}"
        # pretty?
        "walld" # refer to config/swww
        # can't be bothered
        "webcord --disable-gpu; sleep 5; pkill -f webcord; webcord"
        # why
      ];

      input = {
        kb_layout = "br";

        accel_profile = "flat";
        follow_mouse = 1;

        numlock_by_default = true;
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        mouse_move_enables_dpms = true;
        enable_swallow = true;
        swallow_regex = "^(kitty|footclient|Alacritty)";
      };

      general = {
        gaps_in = 4;
        gaps_out = 8;
        border_size = 0;
        #"col.active_border" = "0xff94e2d5";
        #"col.inactive_border" = "0xff89dceb";

        allow_tearing = true;
        no_border_on_floating = false;
        apply_sens_to_raw = 0;
      };

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
          brightness = 0.82;
          new_optimizations = true;
          passes = 5;
          size = 10;
          vibrancy = 0.2;
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

      dwindle = {
        no_gaps_when_only = false;
        pseudotile = true;
        preserve_split = true;
      };
    };
  };
}
