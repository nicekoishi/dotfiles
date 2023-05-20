{ config, pkgs, inputs, lib, ... }:

{
  home.packages = with pkgs; [
    alejandra
    brave
    coreutils
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
    lxqt.pcmanfm-qt
    mpv
    neofetch
    neovim
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
