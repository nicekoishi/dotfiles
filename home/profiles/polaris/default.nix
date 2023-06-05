{
  imports = [
    ../../editors
    ../../gtk.nix
    ../../pcmanfm.nix
    ../../qt.nix
    ../../spicetify.nix
    ../../vscode.nix
    ../../xdg.nix
    ../../../packages/home-pkgs.nix

    ../../shell
    ../../programs
  ];

  home = {
    username = "nicekoishi";
    homeDirectory = "/home/nicekoishi";

    stateVersion = "23.05";
  };
  programs.home-manager.enable = true;
}
