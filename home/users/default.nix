{
  imports = [
    ../../modules/user/gtk.nix
    ../../modules/user/shell
    ../../modules/user/xdg.nix
    ../../modules/user/qt.nix
    ../../packages/home-pkgs.nix

    ../config

    #../home-modules/spicetify.nix failed attempt to make it work: 4 TODO: fix this module
  ];

  home = {
    username = "nicekoishi";
    homeDirectory = "/home/nicekoishi";

    stateVersion = "23.05";
  };
  programs.home-manager.enable = true;
}
