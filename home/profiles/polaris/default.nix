{
  imports = [
    ../../editors
    ../../git.nix
    ../../gnupg.nix
    ../../noise.nix
    ../../pcmanfm.nix
    ../../udiskie.nix
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
