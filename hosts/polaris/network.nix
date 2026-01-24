{lib, ...}: {
  networking = {
    useDHCP = lib.mkDefault true;

    firewall.allowedTCPPorts = [2234];
    networkmanager.unmanaged = ["type:wifi"];
  };

  systemd.network = {
    enable = true;

    wait-online = {
      enable = false;
      anyInterface = true;
    };

    networks = {
      "10-network-eth" = {
        matchConfig.Type = "en*";
        networkConfig = {
          DHCP = true;
          IPv6AcceptRA = true;
          IPv4Forwarding = true;
          IPv6Forwarding = true;
          IPMasquerade = "both";
        };
      };
      "20-network-wlan" = {
        matchConfig.Type = "wlan";
        linkConfig.Unmanaged = true;
      };
    };
  };
}
