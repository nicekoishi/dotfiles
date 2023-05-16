{config,pkgs,...}:

{
  environment.systemPackages = with pkgs; [
    brave
    btop
    emacs
    ffmpeg
    firefox
    git
    jq
    libsForQt5.kdenlive
    kitty
    libreoffice-fresh
    lxqt.lxqt-archiver
    mpv
    neovim
    neofetch
    nuclear
    nvtop
    obs-studio
    lxqt.pcmanfm-qt
    python3Full
    libsForQt5.skanpage
    starship
    spotify
    spice spice-gtk
    spice-protocol
    virt-manager
    virt-viewer
    webcord-vencord
    win-virtio
    win-spice
  ];
}
