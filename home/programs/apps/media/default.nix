{pkgs, ...}: {
  imports = [
    ./editing
    ./mpv
    ./music
    ./obs
  ];

  home.packages = with pkgs; [
    ffmpeg-full
    playerctl
    viewnior
    yt-dlp
    kid3
  ];
}
