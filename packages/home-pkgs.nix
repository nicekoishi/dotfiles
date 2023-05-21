{ pkgs, ... }:

{
  home.packages = with pkgs; [
    alejandra
    brave
    coreutils
    emacs
    fd
    gimp
    grim
    hyprpicker
    jq
    killall
    kitty
    libreoffice-fresh
    libsForQt5.kdenlive
    libsForQt5.skanpage
    lxqt.lxqt-archiver
    mpv
    neofetch
    neovim
    nil
    nvtop
    obs-studio
    playerctl
    python3Full
    ripgrep
    slurp
    starship
    swaynotificationcenter
    unzip
    webcord-vencord
    zip
  ];
}
