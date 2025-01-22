{pkgs, ...}: {
  imports = [
    # ./cantata
    ./spotify
    #./yt-music

    ./beets.nix # music tagging app, nice utility to be paired with kid3
  ];

  home.packages = [
    # As of 21/01/2024, this package uses electron 31.7.7 which is EOL
    # pkgs.feishin
  ];
}
