{config, ...}: {
  programs.beets = {
    enable = true;

    settings = {
      ui.color = true;
      directory = config.services.mpd.musicDirectory;
      library = "${config.services.mpd.musicDirectory}/library.db";

      clutter = [
        "Thumbs.DB"
        ".DS_Store"
        ".directory"
      ];

      plugins = [
        "mpdupdate"
        "absubmit"
        "chroma"
        "duplicates"
        "edit"
        "embedart"
        "fetchart"
        "fromfilename"
        "lastgenre"
        "lyrics"
        "mbsync"
        "replaygain"
        "scrub"
        "thumbnails"
      ];

      mpd = {
        host = "localhost";
        port = 6600;
      };

      import = {
        move = true;
        timid = true;
        detail = true;
        bell = true;
        write = true;
        languages = "en jp pt";
      };

      embedart = {
        auto = true;
        remove_art_file = true;
      };

      acousticbrainz.auto = true;
      chroma.auto = true;
      fetchart.auto = true;
      lyrics.auto = true;
      replaygain.backend = "gstreamer";
      thumbnails.auto = true;
    };
  };
}
