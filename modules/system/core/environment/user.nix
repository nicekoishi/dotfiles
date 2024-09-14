{pkgs, ...}: let
  keys = [
    # polaris, and one second... isn't this already on by default?
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMt/fj0+1c7Ktr9WQCqYHoi3jWSxV8/cwEUaT/92DA7q"

    # android phone, just for testing
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIhD0eTqw4a+9M8Xh2NIo3FGgiprFzRWEsBU5p7k6wc+ u0_a304@localhost"
  ];
in {
  users.users.supeen = {
    isNormalUser = true;
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = keys;
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
}
