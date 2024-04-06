{pkgs, ...}: {
  imports = [
    ./libreoffice
    ./thunderbird
    ./zathura
  ];

  home.packages = with pkgs; [
    # shared stuff
    kdePackages.skanpage
  ];
}
