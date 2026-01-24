{
  programs.firefox.profiles.supeen = {
    settings = {
      # vaapi hardware acceleration
      "gfx.webrender.all" = true;
      "gfx.x11-egl.force-enabled" = true;
      "media.av1.enabled" = false;
      "media.ffmpeg.vaapi.enabled" = true;
      "media.rdd-ffmpeg.enabled" = true;
      "widget.dmabuf.force-enabled" = true;

      # force xdg-desktop-portal-gtk usage
      "widget.use-xdg-desktop-portal.file-picker" = 1;
      "widget.use-xdg-desktop-portal.location" = 1;
      "widget.use-xdg-desktop-portal.mime-handler" = 1;
      "widget.use-xdg-desktop-portal.open-uri" = 1;
      "widget.use-xdg-desktop-portal.settings" = 1;

      # keep the reader button enabled at all times
      "reader.parse-on-load.force-enabled" = true;

      # there's a window rule in hyprland, but anyway...
      "privacy.webrtc.legacyGlobalIndicator" = false;

      # don't hide my context menu, pls
      "dom.event.contextmenu.enabled" = false;
    };
  };
}
