{pkgs, ...}: {
  services = {
    mpd = {
      enable = true;
      #network.startWhenNeeded = true;
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "Pipewire"
        }
        auto_update "yes"
      '';
    };

    mpd-discord-rpc = {
      enable = true;
      settings = {
        # this app has no icons, just the name Cantata
        id = 1221117858709508168;
        hosts = ["localhost:6600"];
        format = {
          details = "$title";
          state = "$album by $artist";
        };
      };
    };
  };
}
