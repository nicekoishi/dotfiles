{pkgs, ...}: {
  home.packages = with pkgs; [
    lxqt.pcmanfm-qt
    lxde.lxmenu-data
    shared-mime-info
  ];
}
