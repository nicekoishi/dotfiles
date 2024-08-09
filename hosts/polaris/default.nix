{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./fs
  ];

  nice = {
    host = {
      cpu = "amd";
      gpu = ["nvidia"];
      environments = ["hyprland" "gnome"];
      waylandReady = true;

      kernel = pkgs.linuxPackages_cachyos;
    };

    user.home-manager = true;
  };

  networking = {
    useDHCP = lib.mkDefault true;

    firewall.allowedTCPPorts = [2234];
    networkmanager.unmanaged = ["type:wifi"];
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
          DHCP = true;
          IPv6AcceptRA = true;
          IPv4Forwarding = true;
          IPv6Forwarding = true;
          IPMasquerade = true;
        };
      };
      "20-network-wlan" = {
        matchConfig.type = "wlan";
        linkConfig.Unmanaged = true;
      };
    };
  };

  services = {
    btrfs.autoScrub.enable = true;
  };

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
}
