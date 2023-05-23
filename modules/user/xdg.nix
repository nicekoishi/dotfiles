{ config, ... }:
let
  browser = [ "brave.desktop" ];
  image = [ "viewnior.desktop" ];
  video = [ "mpv.desktop" ];

  mimeapps = {
    "application/x-extension-htm" = browser;
    "application/x-extension-html" = browser;
    "application/x-extension-shtml" = browser;
    "application/x-extension-xht" = browser;
    "application/x-extension-xhtml" = browser;
    "application/xhtml+xml" = browser;
    "text/html" = browser;
    "x-scheme-handler/about" = browser;
    "x-scheme-handler/chrome" = browser;
    "x-scheme-handler/ftp" = browser;
    "x-scheme-handler/http" = browser;
    "x-scheme-handler/https" = browser;
    "x-scheme-handler/unknown" = browser;

    "application/json" = browser;
    "audio/m4a" = video;
    "audio/mp3" = video;
    "audio/wav" = video;
    "image/jpeg" = image;
    "image/png" = image;
    "image/webp" = image;
    "text/plain" = [ "emacsclient.desktop" ];
    "video/H264" = video;
    "video/H265" = video;
    "x-scheme-handler/discord" = [ "webcord.desktop" ];
    "x-scheme-handler/spotify" = browser;
  };
in {
  xdg = {
    enable = true;
    cacheHome = config.home.homeDirectory + "/.local/cache";

    mimeApps = {
      enable = true;
      defaultApplications = mimeapps;
    };

    userDirs = {
      enable = true;
      createDirectories = true;

      documents = config.home.homeDirectory + "/Documentos";
      download = config.home.homeDirectory + "/Downloads";
      music = config.home.homeDirectory + "/Música";
      pictures = config.home.homeDirectory + "/Imagens";
      videos = config.home.homeDirectory + "/Vídeos";
    };
  };
}
