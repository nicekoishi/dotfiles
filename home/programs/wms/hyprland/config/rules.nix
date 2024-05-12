{lib, ...}: {
  wayland.windowManager.hyprland.settings = {
    layerrule = let
      toRegex = list: let
        elements = lib.concatStringsSep "|" list;
      in "^(${elements})$";

      ignorealpha = [
        "calendar"
        "notifications"
        "anyrun"
      ];

      layers = ignorealpha ++ ["bar" "gtk-layer-shell"];
    in [
      "blur, ${toRegex layers}"
      "xray 1, ${toRegex ["bar" "gtk-layer-shell"]}"
      "ignorealpha 0.2, ${toRegex ["bar" "gtk-layer-shell"]}"
      "ignorealpha 0.5, ${toRegex (ignorealpha ++ ["music"])}"
    ];

    windowrule = [
      # make apps floaty
      "float, anyrun"
      "float, confirm"
      "float, confirmreset"
      "float, dialog"
      "float, download"
      "float, error"
      "float, file_progress"
      "float, org.kde.ark"
      "float, notification"
      "float, splash"
      "float, title:DevTools"
      "float, title:Open File"
      "float, title:Save File"
      "float, title:^(Media viewer)$"
      "float, title:^(Picture-in-Picture)$"
      "float, title:^(Volume Control)$"
      "float, title:branchdialog"
      "float, title:wlogout"
      "float, Viewnior"
      "float, viewnior"
      "float, org.kde.dolphin"

      # thunar opacity
      # "opacity 0.98, thunar"
    ];

    windowrulev2 = [
      # fix xwayland apps
      "center, class:^(.*jetbrains.*)$, title:^(Confirm Exit|Open Project|win424|win201|splash)$"
      "rounding 0, xwayland:1"
      "size 640 400, class:^(.*jetbrains.*)$, title:^(splash)$"

      # shadows for floating only
      "noshadow, floating:0"

      # allow tearing in games
      #"immediate, class:^(osu\!|cs2)$"
      #"immediate, class:^(steam_app_230410)$"

      # idle inhibit while watching videos
      "idleinhibit focus, class:^(mpv|.+exe)$"
      "idleinhibit focus, class:^(chromium-browser|firefox)$, title:^(.*Youtube.*)$"
      "idleinhibit fullscreen, class:^(chromium-browser|firefox)$"

      # throw sharing indicators away
      "workspace special silent, title:^(Firefox — Sharing Indicator)$"
      "workspace special silent, title:^(.*is sharing (your screen|a window)\.)$"

      # bitwarden
      "float, class:Bitwarden"
      "size 800 600, class:Bitwarden"

      # omg how pretty
      "dimaround, class:^(gcr-prompter)$"
      "dimaround, class:^(xdg-desktop-portal-.*)$"
      "dimaround, class:^(polkit-gnome-authentication-agent-1)$"

      # lutris and most games launched through wine create an annoying system tray window
      # go away
      "workspace special silent, title:^(title:Wine System Tray)$"

      # start apps in n workspace
      "tile, initialtitle:^(Spotify( Free| Premium)?)$"

      "workspace 3 silent, class:vesktop"

      "workspace 4 silent, initialtitle:^(Spotify( Free| Premium)?)$"
      "workspace 4 silent, initialclass:^(cantata)$"

      "workspace 5 silent, class:^(lutris*)$"
      "workspace 5 silent, class:^(steam*)$"

      "workspace 6 silent, class:^(virt-manager)$"

      "workspace special:thunderbird silent, initialclass:^(thunderbird)$"
    ];
  };
}
