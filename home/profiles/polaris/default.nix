{
  imports = [
    ../../editors
    ../../git.nix
    ../../gnupg.nix
    ../../gtk.nix
    ../../pcmanfm.nix
    ../../qt.nix
    ../../noise.nix
    ../../spicetify.nix
    ../../vscode.nix
    ../../xdg.nix

    ../../config
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
