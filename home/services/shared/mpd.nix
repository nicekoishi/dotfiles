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
    mpd-mpris.enable = true;

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
        auto_update             "yes"
        volume_normalization    "yes"
        restore_paused          "yes"
        filesystem_charset      "UTF-8"

        audio_output {
          type                  "pipewire"
          name                  "Pipewire"
        }

        audio_output {
          type                  "fifo"
          name                  "Visualizer"
          path                  "/tmp/mpd.fifo"
          format                "44100:16:2"
        }

        audio_output {
          type                  "httpd"
          name                  "lossless"
          encoder               "flac"
          port                  "8000"
          max_clients           "9"
          mixer_type            "software"
          format                "44100:16:2"
        }
      '';
    };

    mpd-discord-rpc = {
      enable = true;
      settings = {
        id = 1221117858709508168;
        format = {
          details = "$title";
          state = "$album by $artist";
        };
      };
    };

    mpdris2 = {
      enable = true;
      notifications = true;
      multimediaKeys = true;
      mpd = {inherit (config.services.mpd) musicDirectory;};
    };
  };
  # BUG: if you skip songs too quickly, it stops updates to discord for some reason
  # This is a temporary workaround, restarting the service every 10 minutes
  # https://github.com/JakeStanger/mpd-discord-rpc/issues/110
  systemd.user.timers.mpd-discord-rpc = {
    Unit.PartOf = ["mpd-discord-rpc.service"];

    Timer.OnUnitActiveSec = "10min";
  };
}
