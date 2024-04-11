{pkgs, ...}: {
  home.packages = with pkgs; [
    ffmpeg-full
    playerctl
    viewnior
    yt-dlp
  ];

  programs.mpv = {
    enable = true;
    defaultProfiles = ["gpu-hq"];
    scripts = [pkgs.mpvScripts.mpris];
  };
}
