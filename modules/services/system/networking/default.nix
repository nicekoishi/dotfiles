{lib, ...}: let
  inherit (lib) mkDefault mkForce;
in {
  imports = [./firewall];
  networking = {
    useDHCP = mkForce false;
    useNetworkd = mkForce true;
    usePredictableInterfaceNames = mkDefault true;

    nameservers = [
      "1.1.1.1"
      "1.0.0.1"
      "2606:4700:4700::1111"
      "2606:4700:4700::1001"
    ];

    networkmanager = {
      enable = true;
      plugins = mkForce [];
      dns = "systemd-resolved";
      unmanaged = [
        "interface-name:virbr*"
      ];
    };

    stevenblack = {
      enable = true;
      block = ["gambling" "porn"];
    };
  };

  services = {
    resolved = {
      enable = true;
      dnssec = "false";
      dnsovertls = "true";
      fallbackDns = ["9.9.9.9"];
    };

    openssh = {
      enable = true;
      openFirewall = true;
      startWhenNeeded = true;
      settings = {
        PermitRootLogin = lib.mkForce "no";

        # pub key auth
        PasswordAuthentication = false;
        AuthenticationMethods = "publickey";
        PubkeyAuthentication = "yes";
        ChallengeResponseAuthentication = "no";
        # why some are booleans and other are yes or no i wonder...
        UsePAM = false;
      };
    };
  };

  systemd.services.NetworkManager-wait-online.enable = mkForce false;
}
