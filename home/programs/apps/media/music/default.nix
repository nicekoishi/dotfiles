{pkgs, ...}: {
  imports = [
    # ./cantata
    ./spotify
    #./yt-music

    ./beets.nix # music tagging app, nice utility to be paired with kid3
  ];

  home.packages = with pkgs; [feishin];
}
