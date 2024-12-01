{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    mpc_cli

    # FIXME: Waiting for this PR to hit unstable
    # https://github.com/NixOS/nixpkgs/pull/355948
    # cava
  ];

  services = {
    playerctld.enable = true;

    # old reliable
    mpd = {
      enable = true;
      musicDirectory = "${config.xdg.userDirs.music}";
      network = {
        listenAddress = "127.0.0.1";
        port = 6600;
      };

      extraConfig = ''
        auto_update             "yes"
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
          format                "48000:16:1"
        }

        input_cache {
          size                  "1 GB"
        }

        resampler {
          plugin                "soxr"
          quality               "high"
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
