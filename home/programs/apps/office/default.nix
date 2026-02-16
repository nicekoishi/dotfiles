{pkgs, ...}: {
  imports = [
    ./libreoffice
    ./zathura
  ];

  home.packages = with pkgs; [naps2];
}
