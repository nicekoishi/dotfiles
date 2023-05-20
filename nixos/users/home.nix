{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../packages/home-pkgs.nix

    ../home-modules/gtk.nix
    ../home-modules/qt.nix
    ../home-modules/vscodium.nix
    #../home-modules/spicetify.nix failed attempt to make it work: 4 TODO: fix this module

    ../shell
  ];

  home = {
    username = "nicekoishi";
    homeDirectory = "/home/nicekoishi";

    stateVersion = "23.05";
  };
  programs.home-manager.enable = true;
}
