{pkgs, ...}: {
  home.packages = with pkgs; [
    brave
    kitty
    mpv
    playerctl
    viewnior
    webcord-vencord
  ];
}
