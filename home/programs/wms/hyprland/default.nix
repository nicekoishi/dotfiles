{
  inputs,
  lib,
  inputs',
  osConfig,
  ...
}: let
  inherit (builtins) toString;
  inherit (lib.attrsets) mapAttrsToList;
  inherit (lib.modules) mkMerge;
  inherit (lib.strings) concatStringsSep;
  inherit (usr.display) main monitors;
  inherit (inputs'.hyprland.packages) hyprland;

  cfg = osConfig.nice;
  usr = cfg.user;

  # FIXME: this function wasn't properly tested at all, but it should work
  mkHyprlandPosition = opts: let
    reference = monitors."${main}";

    posX =
      if (opts.pos == "right")
      then "${toString reference.width}"
      else if (opts.pos == "left")
      then "${toString (-reference.width)}"
      else "0";

    posY =
      if (opts.pos == "top")
      then "${toString (-reference.height)}"
      else if (opts.pos == "bottom")
      then "${toString reference.height}"
      else "0";
  in "${posX}x${posY}";
in {
  imports = [
    inputs.hyprland.homeManagerModules.default
    ./config
  ];

  home.sessionVariables = {
    QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = hyprland;

    systemd = {
      enable = true;
      variables = ["--all"];
    };

    settings = mkMerge [
      {
        # monitor = ["HDMI-A-1, 1920x1080, 0x0, 1"];
        # TODO: do we really need that many toString 's?
        # what the heck is this ugly thing
        monitor = mapAttrsToList (name: opts:
          concatStringsSep "," [
            name
            "${toString opts.width}x${toString opts.height}@${toString opts.refreshRate}"
            (mkHyprlandPosition opts)
            "${toString opts.scale}"
          ])
        monitors;

        # TODO: Temporary fix, come back here when we have time
        workspace =
          (builtins.genList (x: ''
              ${toString (x + 1)}, monitor:${main}${
                if (x + 1) == 1
                then ", default:true"
                else ""
              }
            '')
            10)
          ++ ["name:tv, monitor:HDMI-A-1, persistent:true"];

        exec-once = [
          #"hyprctl setcursor ${config.home.pointerCursor.name} ${toString config.home.pointerCursor.size}"
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

          blur = {
            enabled = true;
            brightness = 0.82;
            contrast = 0.71;
            ignore_opacity = true;
            new_optimizations = true;
            passes = 3;
            size = 5;
            special = true;
            vibrancy = 0.2;
            popups = true;
            xray = true;
          };

          shadow = {
            enabled = true;
            color = "rgba(292c3cee)";
            ignore_window = true;
            offset = "1 2";
            range = 10;
            render_power = 3;
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
        };

        input = {
          kb_layout = "br";

          accel_profile = "flat";
          follow_mouse = 1;

          numlock_by_default = true;
        };

        dwindle = {
          pseudotile = true;
          preserve_split = true;
          smart_split = true;
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
      }
    ];
  };
}
