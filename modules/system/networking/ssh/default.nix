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
  };
}
