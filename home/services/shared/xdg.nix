# okay, this entire file is from fufexan/dotfiles
{
  config,
  pkgs,
  ...
}: let
  browser = ["firefox"];
  imageViewer = ["viewnior"];
  videoPlayer = ["mpv"];
  fileManager = ["org.kde.dolphin"];
  fileArchiver = ["org.kde.ark"];
  mail = ["thunderbird"];

  xdgAssociations = type: program: list:
    builtins.listToAttrs (map (e: {
        name = "${type}/${e}";
        value = program;
      })
      list);

  image = xdgAssociations "image" imageViewer ["png" "svg" "jpeg" "gif" "webp"];
  video = xdgAssociations "video" videoPlayer ["mp4" "avi" "mkv"];
  audio = xdgAssociations "audio" videoPlayer ["flac" "mp3" "wav" "aac"]; # using mpv until I sort this out
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
      "ftp"
      "http"
      "https"
      "unknown"
    ]);
  compressedTypes = xdgAssociations "application" fileArchiver [
    "zip"
    "gzip"
    "rar"
    "x-xz-compressed-tar"
  ];

  # XDG MIME types
  mimeapps = builtins.mapAttrs (_: v: (map (e: "${e}.desktop") v)) ({
      "application/pdf" = ["org.pwmt.zathura-pdf-mupdf"]; # so that was the reason pdf wasn't working
      "text/html" = browser;
      "text/plain" = ["nvim"];
      "inode/directory" = fileManager;
      "x-scheme-handler/discord" = ["Vesktop"];
      "x-scheme-handler/spotify" = ["spotify"];
      "x-scheme-handler/mailto" = mail;
    }
    // image
    // video
    // audio
    // browserTypes
    // compressedTypes);
in {
  xdg = {
    enable = true;
    cacheHome = config.home.homeDirectory + "/.local/cache";

    mimeApps = {
      enable = true;
      associations.added = mimeapps;
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
        XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
        XDG_WALLPAPERS_DIR = "${config.xdg.userDirs.pictures}/Wallpapers";
      };
    };
  };

  home.packages = with pkgs; [
    (writeShellScriptBin "xdg-terminal-exec" ''
      kitty "$@"
    '')
    xdg-utils
  ];
}
