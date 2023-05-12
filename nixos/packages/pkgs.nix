{config,pkgs,...}:

{
  environment.systemPackages = with pkgs; [
    brave
    btop
    clang
    coreutils
    firefox
    fd
    git
    kitty
    libreoffice-fresh
    lxqt.lxqt-archiver
    neovim
    neofetch
    nvtop
    lxqt.pcmanfm-qt
    ripgrep
    libsForQt5.skanpage
    starship
    swww
  ];
}
