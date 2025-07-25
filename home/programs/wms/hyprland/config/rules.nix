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
      "float, title:Viewnior"
      "float, title:anyrun"
      "float, title:com.saivert.pwvucontrol"
      "float, title:confirm"
      "float, title:confirmreset"
      "float, title:dialog"
      "float, title:download"
      "float, title:error"
      "float, title:file_progress"
      "float, title:notification"
      "float, title:org.kde.ark"
      "float, title:org.kde.dolphin"
      "float, title:splash"
      "float, title:DevTools"
      "float, title:Open File"
      "float, title:Save File"
      "float, title:^(Media viewer)$"
      "float, title:^(Picture-in-Picture)$"
      "float, title:^(Volume Control)$"
      "float, title:branchdialog"
      "float, title:wlogout"

      # fix xwayland apps
      "center, class:^(.*jetbrains.*)$, title:^(Confirm Exit|Open Project|win424|win201|splash)$"
      "rounding 0, xwayland:1"
      "size 640 400, class:^(.*jetbrains.*)$, title:^(splash)$"

      # shadows for floating only
      "noshadow, floating:0"

      "float, class:^(xdg-desktop-portal-.*)$"

      # allow tearing in games
      #"immediate, class:^(osu\!|cs2)$"
      #"immediate, class:^(steam_app_230410)$"

      # fix ultrakill fullscreen crash and mouse input
      "allowsinput, class:^(steam_app_1229490)"
      "fullscreen, class:^(steam_app_1229490)"

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

      # headache
      "float, class:thunar"
      "float, class:^(org.gnome.seahorse.Application)"

      # lutris and most games launched through wine create an annoying system tray window
      # go away
      "workspace special silent, title:^(title:Wine System Tray)$"

      # force input
      "allowsinput,class:^(steam_app_230410)$"

      # start apps in n workspace
      "tile, initialtitle:^(Spotify( Free| Premium)?)$"

      "workspace 3 silent, class:equibop"

      "workspace 4 silent, initialtitle:^(Spotify( Free| Premium)?)$"
      "workspace 4 silent, initialclass:^(cantata)$"
      "workspace 4 silent, initialclass:^(feishin)$"

      "workspace 5 silent, class:^(lutris*)$"
      "workspace 5 silent, class:^(steam*)$"
      "workspace 5 silent, class:^(steam_app_\d+)$"

      "workspace 6 silent, class:^(virt-manager)$"
    ];
  };
}
