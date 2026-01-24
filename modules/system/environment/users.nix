{pkgs, ...}: let
  # keys = [
  #   # User key that I sometimes backup, please don't lose it again.
  #   # Also, `config.age.identityPaths` already reads our host keys.
  #   "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILS3uO3yGee8JadAAwk9ojmyv0+fX4XG3sqSYxVVigQF"
  #   # To turn my PC off using SSH. Yes, that's it. Dumb.
  #   "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIhD0eTqw4a+9M8Xh2NIo3FGgiprFzRWEsBU5p7k6wc+ u0_a304@localhost"
  # ];
in {
  users = {
    defaultUserShell = pkgs.zsh;

    users = {
      supeen = {
        isNormalUser = true;
        createHome = true;
        home = "/home/supeen";
        shell = pkgs.zsh;

        # yada yada 3 days
        initialHashedPassword = "$2b$16$ILEKQWp0Hib7ePcVfrEzPOg8wh6FQwTaV3NCJ4S/pmJ7G7B4t5ftC";
        #openssh.authorizedKeys.keys = keys;

        extraGroups = [
          "wheel"
          "adbusers"
          "adm"
          "audio"
          "kvm"
          "libvirtd"
          "lp"
          "network"
          "networkmanager"
          "nix"
          "power"
          "rfkill"
          "scanner"
          "supeen"
          "video"
        ]; # Better be safe than sorry
      };

      root.hashedPassword = "*";
    };
  };
}
