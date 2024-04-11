{pkgs, ...}: {
  imports = [./video];

  home.packages = with pkgs; [
    ffmpeg-full
    playerctl
    viewnior
    yt-dlp
  ];
}
