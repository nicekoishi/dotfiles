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
        "chroma"
        "spotify"
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

      fetchart = {
        auto = true;
        # since we're using navidrome, we can afford to be a little greedy
        high_resolution = true;
        maxwidth = 3000; # but not too much
      };

      acousticbrainz.auto = true;
      chroma.auto = true;
      lyrics.auto = true;
      replaygain.backend = "gstreamer";
      thumbnails.auto = true;
      spotify.source_weight = 0.5;
      mbsync.source_weight = 0.0;
    };
  };
}
