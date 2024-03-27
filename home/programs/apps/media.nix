{pkgs, ...}: {
  home.packages = with pkgs; [
    brave
    playerctl
    viewnior
  ];

  programs.mpv = {
    enable = true;
    defaultProfiles = ["gpu-hq"];
  };
}
