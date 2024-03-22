{pkgs, ...}: {
  home.packages = with pkgs; [
    brave
<<<<<<< HEAD
    kitty
    mpv
    playerctl
    viewnior
    webcord-vencord
=======
    mpv
    playerctl
    viewnior
>>>>>>> 12c72a1 (too lazy to separate them all)
  ];
}
