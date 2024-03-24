{inputs, ...}: {
  imports = [
    inputs.hyprland.homeManagerModules.default
    ./binds.nix
    ./hypridle.nix
    ./rules.nix
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

    settings = {
      "$mod" = "SUPER";
      monitor = [", 1920x1080, 0x0, 1"];

      exec-once = [
        # pretty?
        "walld" # refer to config/swww
        # can't be bothered
        "webcord --disable-gpu; sleep 5; pkill -f webcord; webcord"
        # why
        "hyprland-bitwarden-resize"
      ];

      input = {
        kb_layout = "br";
        follow_mouse = 1;
        sensitivity = 0;
        numlock_by_default = true;
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        mouse_move_enables_dpms = true;
        enable_swallow = true;
        swallow_regex = "^(kitty)$";
      };

      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 1;
        "col.active_border" = "0xff94e2d5";
        "col.inactive_border" = "0xff89dceb";

        no_border_on_floating = false;
        allow_tearing = true;
      };

      decoration = {
        rounding = 8;
        drop_shadow = false;
        shadow_ignore_window = true;
        shadow_offset = "1 2";
        shadow_range = 20;
        shadow_render_power = 2;
        "col.shadow" = "rgba(1a1a1aee)";

        blur = {
          enabled = true;
          size = 2;
          passes = 3;
          new_optimizations = true;
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
          "fade, 1, 7, default"
          "fadeDim, 1, 10, smoothIn"
          "workspaces, 1, 6, default"
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
