{
  config,
  lib,
  ...
}: let
  inherit (builtins) toString;
  inherit (lib.attrsets) mapAttrs;
  inherit (lib.modules) mkForce;
  inherit (lib.strings) concatMapStringsSep;
in {
  services = {
    openssh = {
      enable = true;
      openFirewall = true;
      ports = [144];
      startWhenNeeded = true;

      settings = mapAttrs (_: mkForce) {
        PermitRootLogin = "no";

        # pub key auth
        PasswordAuthentication = false;
        AuthenticationMethods = "publickey";
        PubkeyAuthentication = "yes";
        ChallengeResponseAuthentication = "no";
        UsePAM = false;

        ClientAliveCountMax = 5;
        ClientAliveInterval = 60;

        MaxAuthTries = 3;
      };

      hostKeys = [
        {
          bits = 4096;
          path = "/etc/ssh/ssh_host_rsa_key";
          type = "rsa";
        }
        {
          path = "/etc/ssh/ssh_host_ed25519_key";
          type = "ed25519";
        }
      ];
    };

    fail2ban.jails = {
      sshd.settings = {
        enabled = true;
        filter = "sshd[mode=aggressive]";
        port = concatMapStringsSep "," toString config.services.openssh.ports;
      };
    };
  };

  programs.ssh.startAgent = true;
}
