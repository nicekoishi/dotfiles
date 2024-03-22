{
  imports = [
    ../../editors
    ../../git.nix
    ../../gnupg.nix
    ../../gtk.nix
    ../../pcmanfm.nix
    ../../qt.nix
    ../../noise.nix
<<<<<<< HEAD
    ../../spicetify.nix
    ../../vscode.nix
=======
>>>>>>> 12c72a1 (too lazy to separate them all)
    ../../xdg.nix

    ../../config
    ../../shell
    ../../programs
  ];

  home = {
<<<<<<< HEAD
    username = "nicekoishi";
    homeDirectory = "/home/nicekoishi";

    stateVersion = "23.05";
=======
    username = "supeen";
    homeDirectory = "/home/supeen";

    stateVersion = "23.11";
>>>>>>> 12c72a1 (too lazy to separate them all)
  };
  programs.home-manager.enable = true;
}
