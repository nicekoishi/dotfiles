let
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
  wayland.windowManager.hyprland.settings = {
    # mouse movements
    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    bind =
      [
        # apps
        "$mod, A, exec, swaync-client -t -sw"
        "$mod, B, exec, brave &"
        "$mod, E, exec, pcmanfm-qt"
        "$mod, Q, exec, kitty"
        "$mod, R, exec, pkill anyrun || anyrun"

        # commands
        "$mod, C, killactive"
        "$mod, F, togglefloating"
        "$mod, J, togglesplit"
        "$mod, M, exit"
        "$mod, P, pseudo"

        # move focus
        "$mod, down, movefocus, d"
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"

        # scroll through workspaces
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

        # screenshot
        "ALT, Print, exec, grimblast --cursor --notify copysave area"
        ", Print, exec, grimblast --notify copysave output"
      ]
      ++ workspaces;

    bindr = [
      "$mod, TAB, fullscreen, 0"
      "$mod, APOSTROPHE, fullscreen, 1"
    ];

    bindle = [
      # media controls
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPrev, exec, playerctl previous"

      # volume
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK 5%-"
      ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK 5%+"
    ];
  };
}
