{
  imports = [
    ../../editors
    ../../git.nix
    ../../gnupg.nix
    ../../pcmanfm.nix
    ../../noise.nix
    ../../xdg.nix

    ../../config
    ../../shell
    ../../programs
    ../../theme
  ];

  home = {
    username = "supeen";
    homeDirectory = "/home/supeen";

    stateVersion = "23.11";
  };
  programs.home-manager.enable = true;
}
