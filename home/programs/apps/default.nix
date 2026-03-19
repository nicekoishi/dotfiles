{pkgs, ...}: {
  imports = [
    ./browsers
    ./discord
    ./office
    ./obs.nix
  ];

  home.packages = with pkgs; [
    qbittorrent
    kdePackages.ark
  ];
}
