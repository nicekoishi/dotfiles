{
  wayland.windowManager.hyprland.settings = {
    layerrule = [
      "blur, ^(gtk-layer-shell|wofi|anyrun)$"
      "ignorezero, ^(gtk-layer-shell|wofi|anyrun)$"
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
      "float, lxqt-archiver"
      "float, notification"
      "float, thunar"
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
      "float,^(thunar)$"

      # idle inhibit
      "idleinhibit focus, mpv"
      "idleinhibit focus, brave"

      # thunar opacity
      "opacity 0.92, thunar"

      # how wine can be drunk
      "center, winecfg.exe"
      "center, zenity"
      "center, steam_proton"
      "float, zenity"
      "nomaxsize, explorer.exe"
      "nomaxsize, steam_proton"
      "nomaxsize, winecfg.exe"
      "size 415 470, steam_proton"
      "size 415 470, winecfg.exe"

      # didn't they put an anticheat a while ago?
      "center,^(league of legends.exe)$"
      "center,^(leagueclientux.exe)$"
      "forceinput,^(league of legends.exe)$"
      "nomaxsize, riotclientux.exe"
      "size 1280 720,^(leagueclientux.exe)$"
      "size 1280 720,^(riotclientux.exe)$"
    ];

    windowrulev2 = [
      # fix xwayland apps
      "center, class:^(.*jetbrains.*)$, title:^(Confirm Exit|Open Project|win424|win201|splash)$"
      "rounding 0, xwayland:1, floating:1"

      # oh wait, well too lazy to delete this now
      "float,workspace 5 silent,class:^(leagueclientux.exe)$,title:^(League of Legends)$"
      "fullscreen, workspace 5 silent,class:^(league of legends.exe)$,title:^(League of Legends (TM) Client)$ windowrule = size 1920 1080,^(league of legends.exe)$"

      # bruh
      "suppressevent maximize, class:^(brave-browser)$"

      # start apps in n workspace
      "tile, title:^(Spotify)$"
      "workspace 3 silent, class:^(WebCord)$"
      "workspace 4 silent, title:(.*)(Cantata)$"
      "workspace 5 silent, class:^(lutris*)$"
      "workspace 5 silent, class:^(steam*)$"
      "workspace 6 silent, class:^(virt-manager)$"
    ];
  };
}
