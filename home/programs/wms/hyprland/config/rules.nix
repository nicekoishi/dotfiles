{lib, ...}: {
  wayland.windowManager.hyprland.settings = {
    layerrule = let
      toRegex = list: let
        elements = lib.concatStringsSep "|" list;
      in "match:namespace ^(${elements})$";

      ignorealpha = [
        "calendar"
        "notifications"
        "anyrun"
      ];

      layers = ignorealpha ++ ["bar" "gtk-layer-shell"];
    in [
      "blur on, ${toRegex layers}"
      "xray on, ${toRegex ["bar" "gtk-layer-shell"]}"
      "ignore_alpha 0.2, ${toRegex ["bar" "gtk-layer-shell"]}"
      "ignore_alpha 0.5, ${toRegex (ignorealpha ++ ["music"])}"
    ];

    windowrule = [
      # make apps floaty
      "float on, match:title Viewnior"
      "float on, match:title anyrun"
      "float on, match:title com.saivert.pwvucontrol"
      "float on, match:title confirm"
      "float on, match:title confirmreset"
      "float on, match:title dialog"
      "float on, match:title download"
      "float on, match:title error"
      "float on, match:title file_progress"
      "float on, match:title notification"
      "float on, match:title org.kde.ark"
      "float on, match:title org.kde.dolphin"
      "float on, match:title splash"
      "float on, match:title DevTools"
      "float on, match:title Open File"
      "float on, match:title Save File"
      "float on, match:title ^(Media viewer)$"
      "float on, match:title ^(Picture-in-Picture)$"
      "float on, match:title ^(Volume Control)$"
      "float on, match:title branchdialog"
      "float on, match:title wlogout"

      # fix xwayland apps
      "center on, match:class ^(.*jetbrains.*)$, match:title ^(Confirm Exit|Open Project|win424|win201|splash)$"
      "rounding 0, match:xwayland true"
      "size 640 400, match:class ^(.*jetbrains.*)$, match:title ^(splash)$"

      # shadows for floating only
      "no_shadow on, match:float true"

      "float on, match:class ^(xdg-desktop-portal-.*)$"

      # allow tearing in games
      #"immediate, class:^(osu\!|cs2)$"
      #"immediate, class:^(steam_app_230410)$"

      # fix ultrakill fullscreen crash and mouse input
      "allows_input on, match:class ^(steam_app_1229490)"
      "fullscreen on, match:class ^(steam_app_1229490)"

      # idle inhibit while watching videos
      "idle_inhibit focus, match:class ^(mpv|.+exe)$"
      "idle_inhibit focus, match:class ^(chromium-browser|firefox)$, match:title ^(.*Youtube.*)$"
      "idle_inhibit fullscreen, match:class ^(chromium-browser|firefox)$"

      # throw sharing indicators away
      "workspace special silent, match:title (Firefox — Sharing Indicator)$"
      "workspace special silent, match:title (.*is sharing (your screen|a window)\.)$"

      # bitwarden
      "float on, match:class Bitwarden"
      "size 800 600, match:class Bitwarden"

      # omg how pretty
      "dim_around on, match:class (gcr-prompter)$"
      "dim_around on, match:class (xdg-desktop-portal-.*)$"
      "dim_around on, match:class (polkit-gnome-authentication-agent-1)$"

      # headache
      "float on, match:class thunar"
      "float on, match:class ^(org.gnome.seahorse.Application)"

      # lutris and most games launched through wine create an annoying system tray window
      # go away
      "workspace special silent, match:title ^(title:Wine System Tray)$"

      # force input
      "allows_input on,match:class ^(steam_app_230410)$"

      # start apps in n workspace
      "tile on, match:initial_title ^(Spotify( Free| Premium)?)$"

      "workspace 3 silent, match:class equibop"

      "workspace 4 silent, match:initial_title (Spotify( Free| Premium)?)$"
      "workspace 4 silent, match:initial_class (cantata)$"
      "workspace 4 silent, match:initial_class (feishin)$"

      "workspace 5 silent, match:class (lutris*)$"
      "workspace 5 silent, match:class (steam*)$"
      "workspace 5 silent, match:class (steam_app_\d+)$"

      "workspace 6 silent, match:class ^(virt-manager)$"
    ];
  };
}
