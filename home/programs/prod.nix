{pkgs, ...}: {
  home.packages = with pkgs; [
    gimp
    krita
    libreoffice-fresh
    lxqt.lxqt-archiver
    obs-studio
    libsForQt5.kdenlive
    libsForQt5.skanpage
<<<<<<< HEAD
=======
    ripgrep
>>>>>>> 12c72a1 (too lazy to separate them all)
  ];
}
