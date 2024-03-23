# okay, this entire file is from fufexan/dotfiles
{config, ...}: let
  browser = ["brave-browser"];
  imageViewer = ["viewnior"];
  videoPlayer = ["mpv"];

  xdgAssociations = type: program: list:
    builtins.listToAttrs (map (e: {
        name = "${type}/${e}";
        value = program;
      })
      list);

  image = xdgAssociations "image" imageViewer ["png" "svg" "jpeg" "gif" "webp"];
  video = xdgAssociations "video" videoPlayer ["mp4" "avi" "mkv"];
  browserTypes =
    (xdgAssociations "application" browser [
      "json"
      "x-extension-htm"
      "x-extension-html"
      "x-extension-shtml"
      "x-extension-xht"
      "x-extension-xhtml"
    ])
    // (xdgAssociations "x-scheme-handler" browser [
      "about"
      "chrome"
      "ftp"
      "http"
      "https"
      "unknown"
    ]);

  # XDG MIME types
  mimeapps = builtins.mapAttrs (_: v: (map (e: "${e}.desktop") v)) ({
      "application/pdf" = ["org.pwmt.zathura.desktop"];
      "text/html" = browser;
      "text/plain" = ["nvim"];
      "inode/directory" = ["pcmanfm-qt"];
      "x-scheme-handler/discord" = ["webcord"];
      "x-scheme-handler/spotify" = browser;
    }
    // image
    // video
    // browserTypes);
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

      publicShare = null;
      templates = null;
      documents = config.home.homeDirectory + "/Documents";
      download = config.home.homeDirectory + "/Downloads";
      music = config.home.homeDirectory + "/Music";
      pictures = config.home.homeDirectory + "/Pictures";
      videos = config.home.homeDirectory + "/Videos";

      extraConfig = {
        XDG_SCREENSHOT_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
      };
    };
  };
}
