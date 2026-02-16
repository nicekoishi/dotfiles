{
  osConfig,
  lib,
  pkgs,
  ...
}: let
  inherit (osConfig.nice) user;
  inherit (lib.modules) mkIf mkMerge;
in {
  config = mkIf user.apps.media {
    services = {
      playerctld.enable = true;
      udiskie.enable = true;
    };

    home.packages = with pkgs;
      mkMerge [
        [
          playerctl
          viewnior
          ffmpeg-full
          yt-dlp
        ]

        (mkIf user.desktop.hyprland.enable [grimblast])
      ];
  };
}
