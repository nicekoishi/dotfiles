{pkgs, ...}: {
  imports = [
    #./browsers/brave.nix
    ./browsers/chromium.nix

    ./discord
    ./media
    ./office
  ];

  home.packages = with pkgs; [
    qbittorrent
  ];
}
