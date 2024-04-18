{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    mpc_cli
    cava
  ];

  services = {
    playerctld.enable = true;
    #mpd-mpris.enable = true; # if i'm using cantata, do I really need this?

    # old reliable
    mpd = {
      enable = true;
      musicDirectory = "${config.xdg.userDirs.music}";
      network = {
        startWhenNeeded = true;
        listenAddress = "127.0.0.1";
        port = 6600;
      };

      extraConfig = ''
        auto_update "yes"
        volume_normalization "yes"
        restore_paused "yes"
        filesystem_charset "UTF-8"

        audio_output {
          type "pipewire"
          name "Pipewire"
        }

        audio_output {
          type "fifo"
          name "Visualizer"
          path "/tmp/mpd.fifo"
          format "44100:16:2"
        }

        audio_output {
          type "httpd"
          name "lossless"
          encoder "flac"
          port "8000"
          max_clients "9"
          mixer_type "software"
          format "44100:16:2"
        }
      '';
    };

    mpdris2 = {
      enable = true;
      notifications = true;
      multimediaKeys = false;
      mpd = {inherit (config.services.mpd) musicDirectory;};
    };

    # disabled as it was spamming journalctl, because it was starting before arRPC
    # it should be fixed now, as I removed the host option
    mpd-discord-rpc = {
      enable = true;
      settings = {
        # this app has no icons, just the name Cantata
        id = 1221117858709508168;
        format = {
          details = "$title";
          state = "$album by $artist";
        };
      };
    };
  };
}
