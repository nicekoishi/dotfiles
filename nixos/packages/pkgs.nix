{config,pkgs,...}:

{
  environment.systemPackages = with pkgs; [
    brave
    btop
    emacs
    git
    jq
    libsForQt5.kdenlive
    kitty
    libreoffice-fresh
    lxqt.lxqt-archiver
    mpv
    neovim
    neofetch
    nvtop
    obs-studio
    lxqt.pcmanfm-qt
    libsForQt5.skanpage
    starship
    spice spice-gtk
    spice-protocol
    virt-manager
    virt-viewer
    webcord-vencord
    win-virtio
    win-spice
  ];
}
