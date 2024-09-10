{lib, ...}: let
  inherit (lib.modules) mkForce;
in {
  services.openssh = {
    enable = true;
    openFirewall = true;
    startWhenNeeded = true;

    settings = {
      PermitRootLogin = mkForce "no";

      # pub key auth
      PasswordAuthentication = false;
      AuthenticationMethods = "publickey";
      PubkeyAuthentication = "yes";
      ChallengeResponseAuthentication = "no";
      UsePAM = false;
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
}
