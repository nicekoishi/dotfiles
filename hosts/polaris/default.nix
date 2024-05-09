{
  lib,
  pkgs,
  self,
  ...
}: {
  imports = [
    self.nixosModules.gpu-pass
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

  # temporary, soulseek port
  networking.firewall.allowedTCPPorts = [2234];

  virtualisation.libvirtd.gpu-pass = {
    enable = true;
    devices = ["pci_0000_06_00_0" "pci_0000_06_00_1" "pci_0000_06_00_2" "pci_0000_06_00_3"];
    guest = "Windows";
    desktopEntry = true;

    optimize = {
      enable = true;
      host = "0";
      topography = "0-5";
    };
  };

  services = {
    fstrim.enable = true;
    btrfs.autoScrub.enable = true;
  };
}
