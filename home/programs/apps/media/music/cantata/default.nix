{pkgs, ...}: {
  imports = [
    ./mpd.nix
  ];

  home.packages = [pkgs.cantata];
}
