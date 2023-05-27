{
  imports = [
    ../../modules/user/gtk.nix
    ../../modules/user/neovim.nix
    ../../modules/user/qt.nix
    ../../modules/user/spicetify.nix
    ../../modules/user/nemo.nix
    ../../modules/user/vscode.nix
    ../../modules/user/xdg.nix
    ../../packages/home-pkgs.nix

    ../../modules/user/shell
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
