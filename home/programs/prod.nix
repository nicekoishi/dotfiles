{pkgs, ...}: {
  home.packages = with pkgs; [
    gimp
    krita
    libreoffice-fresh
    lxqt.lxqt-archiver
    obs-studio
    libsForQt5.kdenlive
    libsForQt5.skanpage
  ];
}
