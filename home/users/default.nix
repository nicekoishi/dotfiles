{
  imports = [
    ../../packages/home-pkgs.nix
    ../../modules/user/qt.nix
    ../../modules/user/gtk.nix
    ../../modules/user/shell

    #../home-modules/spicetify.nix failed attempt to make it work: 4 TODO: fix this module
  ];

  home = {
    username = "nicekoishi";
    # FIXME: Conflicting values, if setting up from scratch uncomment this!!
    #homeDirectory = "/home/nicekoishi";

    stateVersion = "23.05";
  };
  programs.home-manager.enable = true;
}
