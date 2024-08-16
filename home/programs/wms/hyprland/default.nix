{
  config,
  inputs,
  lib,
  osConfig,
  ...
}: let
  inherit (builtins) elem toString;
  inherit (lib.attrsets) mapAttrsToList;
  inherit (lib.modules) mkIf;
  inherit (lib.strings) concatStringsSep;

  cfg = osConfig.nice;
  usr = cfg.user;
  host = cfg.host;
in {
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
      # monitor = ["HDMI-A-1, 1920x1080, 0x0, 1"];
      # TODO: do we really need that many toString 's?
      # what the heck is this ugly thing
      monitor = mapAttrsToList (name: opts:
        concatStringsSep "," [
          name
          "${toString opts.width}x${toString opts.height}@${toString opts.refreshRate}"
          "${toString opts.pos.x}x${toString opts.pos.y}"
          "1"
        ])
      usr.monitors;

      env = [
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
      ];

      exec-once = [
        "hyprctl setcursor ${config.home.pointerCursor.name} ${toString config.home.pointerCursor.size}"
      ];

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

      device = {
        name = "wacom-one-by-wacom-s-pen";
        accel_profile = "flat";
        left_handed = true;
      };

      general = {
        gaps_in = 4;
        gaps_out = 8;
        border_size = 0;
        #"col.active_border" = "0xff94e2d5";
        #"col.inactive_border" = "0xff89dceb";

        no_border_on_floating = false;
        apply_sens_to_raw = false;
      };

      input = {
        kb_layout = "br";

        accel_profile = "flat";
        follow_mouse = 1;

        numlock_by_default = true;
      };

      dwindle = {
        no_gaps_when_only = false;
        pseudotile = true;
        preserve_split = true;
      };

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

      # https://github.com/hyprwm/Hyprland/issues/7230
      # the default is 2, and it should disable it for nvidia gpu's... but it doesn't
      # so we have to explicitly disable it - shut up, it's not funny
      render = mkIf (elem "nvidia" host.gpu) {
        explicit_sync = 0;
        explicit_sync_kms = 0;
      };
    };
  };
}
