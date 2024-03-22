{
  imports = [
    ../../editors
    ../../git.nix
    ../../gnupg.nix
    ../../gtk.nix
    ../../pcmanfm.nix
    ../../qt.nix
    ../../noise.nix
    ../../xdg.nix

    ../../config
    ../../shell
    ../../programs
  ];

  home = {
    username = "supeen";
    homeDirectory = "/home/supeen";

    stateVersion = "23.11";
  };
  programs.home-manager.enable = true;
}
