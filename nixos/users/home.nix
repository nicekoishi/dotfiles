{ config, pkgs, ...}:

{
  imports = [
    ../../packages/home-pkgs.nix

    ../home-modules/gtk.nix
    ../home-modules/qt.nix

    ../shell
  ];

  home = {
    username = "nicekoishi";
    homeDirectory = "/home/nicekoishi";

    stateVersion = "23.05";
  };
  programs.home-manager.enable = true;
}
