# notashelf/nyx
{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkMerge mkForce;
  inherit (lib.strings) concatStringsSep;
in {
  services.fail2ban = {
    enable = true;
    maxretry = 5;

    bantime-increment = {
      enable = true;
      rndtime = "11m";
      overalljails = true;
      multipliers = "4 8 16 32 64 128 256 512 1024 2048";
      maxtime = "5000h"; # get banned for 5000 hours idiot
    };

    ignoreIP = [
      "127.0.0.1/8" # localhost
      "192.168.1.0/24" # local network
    ];

    jails = mkMerge [
      {
        sshd = mkForce ''
          enabled = true
          port = ${concatStringsSep "," (builtins.map toString config.services.openssh.ports)}
          mode = aggressive
        '';
      }
    ];
  };
}
