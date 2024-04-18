{pkgs, ...}: {
  imports = [
    ./beets.nix # get audio track metadata, overall nice utility to have
    ./mpd.nix # this wouldn't work without mpd, right?
  ];

  home.packages = [pkgs.cantata];
}
