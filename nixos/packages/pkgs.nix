{config,pkgs,...}:

{
  environment.systemPackages = with pkgs; [
    brave
    btop
    firefox
    git
    kitty
    libreoffice-fresh
    lxqt.lxqt-archiver
    neovim
    neofetch
    nvtop
    lxqt.pcmanfm-qt
    libsForQt5.skanpage
    starship
  ];
}
