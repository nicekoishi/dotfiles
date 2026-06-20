{
  config,
  inputs,
  lib,
  inputs',
  osConfig,
  ...
}: let
  inherit (builtins) length genList elemAt;
  inherit (lib.generators) mkLuaInline;
  inherit (lib.modules) mkMerge;
  inherit (lib.attrsets) attrNames mapAttrsToList;
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
        on = [
          {
            _args = let
              command = "hyprctl setcursor ${config.home.pointerCursor.name} ${toString config.home.pointerCursor.size}";
            in [
              "hyprland.start"
              (mkLuaInline ''
                function()
                  hl.exec_cmd("${command}")
                end'')
            ];
          }
        ];

        # how tf this survived the lua migration
        monitor = genList (x:
          elemAt (mapAttrsToList (_: value: {
              output = "desc:${value.description}";
              mode = "${value.width}x${value.height}@${value.refreshRate}";
              position = "${mkHyprlandPosition value}";
              scale = "${value.scale}";
              transform = 0;
            })
            monitors)
          x) (length (attrNames monitors));

        device = [
          {
            _args = [
              {
                name = "wacom-one-by-wacom-s-pen";
                accel_profile = "flat";
                left_handed = true;
              }
            ];
          }
        ];

        config = mkMerge [
          {
            animations = {
              enabled = true;
              workspace_wraparound = false;
            };

            general = {
              layout = "dwindle";
              gaps_in = 4;
              gaps_out = 8;
              border_size = 0;
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
                offset = "1 2";
                range = 10;
                render_power = 3;
              };
            };

            input = {
              kb_layout = "br";

              accel_profile = "flat";
              follow_mouse = 1;

              numlock_by_default = true;
            };

            dwindle = {
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
            };
          }
        ];

        animation = [
          {
            enabled = true;
            leaf = "windows";
            speed = 5;
            bezier = "overshot";
            style = "slide";
          }
          {
            enabled = true;
            leaf = "windowsOut";
            speed = 4;
            bezier = "smoothOut";
            style = "slide";
          }
          {
            enabled = true;
            leaf = "windowsMove";
            speed = 4;
            style = "default";
          }
          {
            enabled = true;
            leaf = "border";
            speed = 10;
            style = "default";
          }
          {
            enabled = true;
            leaf = "borderangle";
            speed = 8;
            style = "default";
          }
          {
            enabled = true;
            leaf = "fade";
            speed = 10;
            bezier = "smoothIn";
          }
          {
            enabled = true;
            leaf = "fadeDim";
            speed = 10;
            bezier = "smoothIn";
          }
          {
            enabled = true;
            leaf = "workspaces";
            speed = 4;
            bezier = "overshot";
            style = "slidevert";
          }
        ];

        curve = [
          {
            _args = [
              "overshot"
              {
                type = "bezier";
                points = ["0.05, 0.09" "0.1, 1.05"];
              }
            ];
          }
          {
            _args = [
              "smoothOut"
              {
                type = "bezier";
                points = ["0.36, 0" "0.66, -0.56"];
              }
            ];
          }
          {
            _args = [
              "smoothIn"
              {
                type = "bezier";
                points = ["0.25, 1" "0.5, 1"];
              }
            ];
          }
        ];
      }
    ];
  };
}
