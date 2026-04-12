{pkgs, ...}: {
  imports = [
    ./browsers
    ./discord
    ./office
    ./media
  ];

  home.packages = with pkgs; [
    qbittorrent
    kdePackages.ark
  ];
}
