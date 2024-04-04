{pkgs, ...}: {
  imports = [
    ./mpd.nix
  ];

  xdg.configFile."cantata/cantata.conf".source = ./cantata.conf;
  home.packages = [pkgs.cantata];
}
