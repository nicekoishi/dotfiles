{pkgs, ...}: {
  imports = [
    ./browsers
    ./discord
    ./office
  ];

  home.packages = with pkgs; [
    qbittorrent
    kdePackages.ark
  ];
}
