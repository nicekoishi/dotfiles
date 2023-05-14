{config,pkgs,...}:

{
  environment.systemPackages = with pkgs; [
    brave
    btop
    emacs
    git
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
    virt-manager
    virt-viewer
    spice spice-gtk
    spice-protocol
    win-virtio
    win-spice
  ];
}
