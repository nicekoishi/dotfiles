{pkgs, ...}: {
  home.packages = with pkgs; [
    playerctl
    viewnior
  ];

  programs.mpv = {
    enable = true;
    defaultProfiles = ["gpu-hq"];
  };
}
