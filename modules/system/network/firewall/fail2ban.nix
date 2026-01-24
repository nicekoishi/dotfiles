# notashelf/nyx
{
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
      "100.64.0.0/16" # le tailscale
    ];
  };
}
