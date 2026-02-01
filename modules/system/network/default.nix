{lib, ...}: let
  inherit (lib.modules) mkDefault mkForce;
in {
  imports = [
    ./firewall
    ./ssh
    #./tailscale
  ];

  networking = {
    useDHCP = mkForce false;
    useNetworkd = mkForce true;
    usePredictableInterfaceNames = mkDefault true;

    nameservers = [
      # cloudflare
      "1.1.1.1"
      "1.0.0.1"
      "2606:4700:4700::1111"
      "2606:4700:4700::1001"

      # quad9
      "9.9.9.9"
      "149.112.112.112"
      "2620:fe::fe"
      "2620:fe::9"
    ];

    networkmanager = {
      enable = true;
      plugins = mkForce [];
      dns = "systemd-resolved";
      unmanaged = [
        "interface-name:virbr*"
      ];

      wifi = {
        backend = "wpa_supplicant";
        macAddress = "random";
        powersave = true;
        scanRandMacAddress = true;
      };
    };
  };

  systemd.services.NetworkManager-wait-online.enable = mkForce false;
}
