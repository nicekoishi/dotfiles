{
  osConfig,
  lib,
  pkgs,
  ...
}: let
  inherit (osConfig.nice) user;
  inherit (lib.modules) mkIf;
in {
  config = mkIf user.apps.media {
    services = {
      playerctld.enable = true;
      udiskie.enable = true;
    };

    home.packages = with pkgs; [
      playerctl
      viewnior
      ffmpeg-full
      yt-dlp
    ];
  };
}
