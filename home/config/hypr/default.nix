{
  config,
  inputs,
  ...
}: let
  homeDir = config.home.homeDirectory;
<<<<<<< HEAD
  wallDir = config.home.homeDirectory + "/Imagens/Wallpapers";
in {
  imports = [inputs.hyprland.homeManagerModules.default];
  xdg.configFile."hypr/macchiato.conf".source = ./macchiato.conf;
  wayland.windowManager.hyprland.systemdIntegration = true;
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.extraConfig = ''
    source = ${homeDir}/.config/hypr/macchiato.conf
    monitor=,1920x1080,0x0,1,bitdepth,10

    exec-once = wl-paste --type text --watch cliphist store
    exec-once = wl-paste --type image --watch cliphist store
    exec-once = swww init && walld init ${wallDir}
    exec-once = eww daemon && eww open bar
    exec-once = arRPC
=======
  wallDir = config.home.homeDirectory + "/Pictures/the holy wallpapers";
in {
  imports = [inputs.hyprland.homeManagerModules.default];
  xdg.configFile."hypr/macchiato.conf".source = ./macchiato.conf;
  wayland.windowManager.hyprland.systemd.enable = true;
  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.extraConfig = ''
    source = ${homeDir}/.config/hypr/macchiato.conf
    monitor=,1920x1080,0x0,1,bitdepth,8

    exec-once = wl-paste --type text --watch cliphist store
    exec-once = wl-paste --type image --watch cliphist store
    exec-once = swww init && swww img ${wallDir}/Sekibanki.gif
>>>>>>> 12c72a1 (too lazy to separate them all)

    input {
      kb_layout = br
      follow_mouse = 1
      sensitivity = 0
      numlock_by_default = true
    }

    misc {
      disable_hyprland_logo = true
      disable_splash_rendering = true
      mouse_move_enables_dpms = true
      enable_swallow = true
      swallow_regex = ^(kitty)$
    }

    general {
      gaps_in = 5
      gaps_out = 5
      border_size = 1
      col.active_border = 0xff94e2d5
      col.inactive_border = 0xff89dceb
      no_border_on_floating = false
      layout = dwindle
    }

    decoration {
      rounding = 8
<<<<<<< HEAD
      multisample_edges = true

      blur = yes
      blur_size = 2
      blur_passes = 3
      blur_new_optimizations = on
      #blurls = gtk-layer-shell
      blurls = lockscreen
=======
>>>>>>> 12c72a1 (too lazy to separate them all)

      drop_shadow = no
      shadow_ignore_window = true
      shadow_offset = 1 2
      shadow_range = 10
      shadow_render_power = 2
      col.shadow = rgba(1a1a1aee)
<<<<<<< HEAD
=======

      blur {
        enabled = true
        size = 2
        passes = 3
        new_optimizations = true
      }
>>>>>>> 12c72a1 (too lazy to separate them all)
    }

    animations {
      enabled = yes

      bezier = overshot, 0.05, 0.9, 0.1, 1.05
      bezier = smoothOut, 0.36, 0, 0.66, -0.56
      bezier = smoothIn, 0.25, 1, 0.5, 1

      animation = windows, 1, 5, overshot, slide
      animation = windowsOut, 1, 4, smoothOut, slide
      animation = windowsMove, 1, 4, default
      animation = border, 1, 10, default
      animation = borderangle, 1, 8, default
      animation = fade, 1, 7, default
      animation = fadeDim, 1, 10, smoothIn
      animation = workspaces, 1, 6, default
    }

    dwindle {
      no_gaps_when_only = false
      pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
      preserve_split = yes # you probably want this
    }

    master {
      new_is_master = true
    }

    # Keybinds
    $mainMod = SUPER

    bind = $mainMod, A, exec, swaync-client -t -sw
    bind = $mainMod, B, exec, brave &
    bind = $mainMod, C, killactive,
    bind = $mainMod, E, exec, pcmanfm-qt
    bind = $mainMod, F, togglefloating,
    bind = $mainMod, F1, exec, killall waybar || waybar &
<<<<<<< HEAD
    bind = $mainMod, F2, exec, walld init ${wallDir}
=======
>>>>>>> 12c72a1 (too lazy to separate them all)
    bind = $mainMod, J, togglesplit, # dwindle
    bind = $mainMod, M, exit,
    bind = $mainMod, P, pseudo, # dwindle
    bind = $mainMod, Q, exec, kitty
    bind = $mainMod, R, exec, pkill anyrun || anyrun
    bind = $mainMod, V, exec, cliphist list | wofi --show dmenu | cliphist decode | wl-copy
    bind = ALT, Q, exec, kitty doas v2 left
    bind = ALT, E, exec, kitty doas v2 right
    bind = SUPERSHIFT, F, fullscreen, 0
    bind = SUPERALT, F, fullscreen, 1
    bind = ALT, F1, exec, ~/.config/hypr/scripts/keybinds
    bind = ALT, F4, exec, wlogout

    # Multimedia
    bind=, XF86AudioNext, exec, playerctl next
    bind=, XF86AudioPause, exec, playerctl play-pause
    bind=, XF86AudioPlay, exec, playerctl play-pause
    bind=, XF86AudioPrev, exec, playerctl previous
    binde=, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    binde=, XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
    binde=, XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
<<<<<<< HEAD
    bind=, Print, exec, grimblast --notify copysave screen ${homeDir}/Imagens/Screenshots/$(date +%Y-%m-%d-%H:%M:%S).png && pw-play ${homeDir}/Música/Notification/camera-shutter.oga
    bind= $mainMod, Print, exec, grimblast --notify copysave active ${homeDir}/Imagens/Screenshots/$(date +%Y-%m-%d-%H:%M:%S).png && pw-play ${homeDir}/Música/Notification/camera-shutter.oga
    bind= ALT, Print, exec, grimblast --notify copysave area ${homeDir}/Imagens/Screenshots/$(date +%Y-%m-%d-%H:%M:%S).png && pw-play ${homeDir}/Música/Notification/camera-shutter.oga
=======
    bind=, Print, exec, grimblast --notify copysave screen ${homeDir}/Pictures/Screenshots/$(date +%Y-%m-%d-%H:%M:%S).png
    bind= $mainMod, Print, exec, grimblast --notify copysave active ${homeDir}/Pictures/Screenshots/$(date +%Y-%m-%d-%H:%M:%S).png
    bind= ALT, Print, exec, grimblast --notify copysave area ${homeDir}/Pictures/Screenshots/$(date +%Y-%m-%d-%H:%M:%S).png
>>>>>>> 12c72a1 (too lazy to separate them all)

    # Move focus with mainMod + arrow keys
    bind = $mainMod, down, movefocus, d
    bind = $mainMod, left, movefocus, l
    bind = $mainMod, right, movefocus, r
    bind = $mainMod, up, movefocus, u

    # Switch workspaces with mainMod + [0-9]
    bind = $mainMod, 0, workspace, 10
    bind = $mainMod, 1, workspace, 1
    bind = $mainMod, 2, workspace, 2
    bind = $mainMod, 3, workspace, 3
    bind = $mainMod, 4, workspace, 4
    bind = $mainMod, 5, workspace, 5
    bind = $mainMod, 6, workspace, 6
    bind = $mainMod, 7, workspace, 7
    bind = $mainMod, 8, workspace, 8
    bind = $mainMod, 9, workspace, 9

    # Move active window to a workspace with mainMod + SHIFT + [0-9]
    bind = $mainMod SHIFT, 0, movetoworkspace, 10
    bind = $mainMod SHIFT, 1, movetoworkspace, 1
    bind = $mainMod SHIFT, 2, movetoworkspace, 2
    bind = $mainMod SHIFT, 3, movetoworkspace, 3
    bind = $mainMod SHIFT, 4, movetoworkspace, 4
    bind = $mainMod SHIFT, 5, movetoworkspace, 5
    bind = $mainMod SHIFT, 6, movetoworkspace, 6
    bind = $mainMod SHIFT, 7, movetoworkspace, 7
    bind = $mainMod SHIFT, 8, movetoworkspace, 8
    bind = $mainMod SHIFT, 9, movetoworkspace, 9

    # Scroll through existing workspaces with mainMod + scroll
    bind = $mainMod, mouse_down, workspace, e+1
    bind = $mainMod, mouse_up, workspace, e-1

    # Move/resize windows with mainMod + LMB/RMB and dragging
    bindm = $mainMod, mouse:272, movewindow
    bindm = $mainMod, mouse:273, resizewindow

    # Workspaces

    windowrule = animation none,anyrun
    windowrule = center, lxqt-archiver
    windowrule = center,^(pcmanfm-qt)$
    windowrule = float, Lxappearance
    windowrule = float, Viewnior
    windowrule = float, anyrun
    windowrule = float, confirm
    windowrule = float, confirmreset
    windowrule = float, dialog
    windowrule = float, download
    windowrule = float, error
    windowrule = float, file_progress
    windowrule = float, geeqie
    windowrule = float, lxqt-archiver
    windowrule = float, notification
    windowrule = float, splash
    windowrule = float, pcmanfm-qt
    windowrule = float, title:DevTools
    windowrule = float, title:Open File
    windowrule = float, title:Salvar Arquivo
    windowrule = float, title:^(Media viewer)$
    windowrule = float, title:^(Picture-in-Picture)$
    windowrule = float, title:^(Volume Control)$
    windowrule = float, title:branchdialog
    windowrule = float, title:wlogout
    windowrule = float, viewnior
    windowrule = float,^(pcmanfm-qt)$
    windowrule = fullscreen, title:wlogout
    windowrule = fullscreen, wlogout
    windowrule = idleinhibit focus, mpv
<<<<<<< HEAD
    windowrule = idleinhibit fullscreen, brave
=======
    windowrule = idleinhibit fullscreen, firefox
>>>>>>> 12c72a1 (too lazy to separate them all)
    windowrule = move 75 44%, title:^(Volume Control)$
    windowrule = opacity 0.92, pcmanfm-qt
    windowrule = size 800 600, title:^(Volume Control)$

    # fix xwayland apps
    layerrule = blur, ^(gtk-layer-shell|wofi|anyrun)$
    layerrule = ignorezero, ^(gtk-layer-shell|wofi|anyrun)$
    windowrulev2 = center, class:^(.*jetbrains.*)$, title:^(Confirm Exit|Open Project|win424|win201|splash)$
    windowrulev2 = rounding 0, xwayland:1, floating:1
    windowrulev2 = size 640 400, class:^(.*jetbrains.*)$, title:^(splash)$

    # League of legends
    windowrule = center,^(league of legends.exe)$
    windowrule = center,^(leagueclientux.exe)$
    windowrule = forceinput,^(league of legends.exe)$
    windowrule = nomaxsize, riotclientux.exe
    windowrule = size 1280 720,^(leagueclientux.exe)$
    windowrule = size 1280 720,^(riotclientux.exe)$
    windowrulev2 = float,workspace 5 silent,class:^(leagueclientux.exe)$,title:^(League of Legends)$
    windowrulev2 = fullscreen, workspace 5 silent,class:^(league of legends.exe)$,title:^(League of Legends (TM) Client)$ windowrule = size 1920 1080,^(league of legends.exe)$

    # Wine weird windows

    windowrule = center, winecfg.exe
    windowrule = center, zenity
    windowrule = center,steam_proton
    windowrule = float, zenity
    windowrule = nomaxsize, explorer.exe
    windowrule = nomaxsize, steam_proton
    windowrule = nomaxsize, winecfg.exe
    windowrule = size 415 470, steam_proton
    windowrule = size 415 470, winecfg.exe

    # Steam
    windowrule = center, title:^(Lista de amigos)$
    windowrule = center, title:^(Steam - News)$
    windowrule = float, title:^(Lista de amigos)$
    windowrule = float, title:^(Steam - News)$ windowrule = size 700 830, title:^(Steam - News)$
    windowrule = size 335 800, title:^(Lista de amigos)$
    windowrule = center, title:^(Warframe)$

    # Spawn in workspace x

    windowrulev2 = tile, title:^(Spotify)$
    windowrulev2 = workspace 3 silent, class:^(WebCord)$
    windowrulev2 = workspace 4 silent, title:^(Spotify)$
    windowrulev2 = workspace 5 silent, class:^(lutris*)$
    windowrulev2 = workspace 5 silent, class:^(steam*)$
    windowrulev2 = workspace 5, class:^(Grapejuice)$
    windowrulev2 = workspace 6 silent, class:^(virt-manager)$
  '';
}
