{pkgs, ...}: {
  home.packages = with pkgs; [
    brave
    mpv
    playerctl
    viewnior
  ];
}
