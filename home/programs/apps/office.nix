{pkgs, ...}: {
  imports = [./zathura.nix];
  home.packages = with pkgs; [
    gimp
    krita
    libreoffice-fresh
    lxqt.lxqt-archiver
    libsForQt5.kdenlive
    libsForQt5.skanpage
    ripgrep
  ];
}
