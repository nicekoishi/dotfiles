{config,pkgs,...}:

{
  imports = [
    ./flake-packages.nix
  ];

  environment.systemPackages = with pkgs; [
    brave
    btop
    emacs
    ffmpeg
    firefox
    gimp
    git
    hyprpicker
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
