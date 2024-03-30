{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
    kernelPackages = lib.mkForce pkgs.linuxPackages_cachyos;
    kernelParams = ["amd-pstate=active"];
  };

  environment.systemPackages = [pkgs.scx];

  systemd.network = {
    enable = true;

    wait-online = {
      enable = false;
      anyInterface = true;
    };

    networks = {
      "10-network-eth" = {
        matchConfig.type = "en*";
        networkConfig = {
          DHCP = "yes";
          IPv6AcceptRA = true;
          IPForward = "yes";
          IPMasquerade = "no";
        };
      };
      # i do have an wifi card, but don't wanna use it. yet
    };
  };

  services = {
    fstrim.enable = true;
    btrfs.autoScrub.enable = true;
  };
}
