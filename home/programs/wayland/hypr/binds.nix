{
  pkgs,
  inputs,
  ...
}: let
  inherit (inputs) anyrun;
  # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
  # fufexan/dotfiles
  workspaces = builtins.concatLists (builtins.genList (
      x: let
        ws = let
          c = (x + 1) / 10;
        in
          builtins.toString (x + 1 - (c * 10));
      in [
        "$mod, ${ws}, workspace, ${toString (x + 1)}"
        "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
      ]
    )
    10);
in {
  # TODO: generate a svg image for all binds, like a cheatsheet
  # wouldn't it be cool?
  wayland.windowManager.hyprland.settings = {
    # mouse movements
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    bind =
      [
        # apps
        "$mod, F1, exec, ags -t bar"
        "$mod, P, exec, emacsclient -c -a emacs"

        "$mod, E, exec, run-as-service thunar"
        "$mod, Q, exec, run-as-service footclient"
        "$mod, R, exec, killall anyrun || run-as-service $(env anyrun)"
        "$mod, V, exec, cliphist list | anyrun --plugins ${anyrun.packages.${pkgs.system}.stdin}/lib/libstdin.so | cliphist decode | wl-copy"
        "$mod, W, exec, chromium-browser &"

        "ALT, F4, exec, wlogout"

        # commands
        "$mod, C, killactive"
        "$mod, F, togglefloating"
        "$mod, G, togglesplit"
        "$mod, B, pseudo"

        # move focus
        "$mod, down, movefocus, d"
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"

        # scroll through workspaces
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

        # quick special
        "$mod SHIFT, S, movetoworkspace, special:magic"
        "$mod, S, togglespecialworkspace, magic"

        # media special
        "$mod SHIFT, D, movetoworkspace, special:media"
        "$mod, D, togglespecialworkspace, media"

        # thunderbird special
        "$mod SHIFT, T, movetoworkspace, special:thunderbird"
        "$mod, T, togglespecialworkspace, thunderbird"

        # screenshot
        "ALT, Print, exec, grimblast --cursor --notify copysave area"
        ", Print, exec, grimblast --notify copysave screen"
      ]
      ++ workspaces;

    bindr = [
      "$mod, TAB, fullscreen, 0"
      "$mod, APOSTROPHE, fullscreen, 1"
    ];

    bindle = [
      # media controls
      "$mod, KP_Decimal, exec, playerctl play-pause"
      "$mod, KP_Add, exec, playerctl next"
      "$mod, KP_Subtract, exec, playerctl previous"

      # volume
      "$mod ALT, KP_Subtract, exec, wpctl set-volume @DEFAULT_AUDIO_SINK 5%-"
      "$mod ALT, KP_Add, exec, wpctl set-volume @DEFAULT_AUDIO_SINK 5%+"
    ];
  };
}
