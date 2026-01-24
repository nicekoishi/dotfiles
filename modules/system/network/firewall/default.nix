{
  imports = [./fail2ban.nix];

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [443 8080];
    allowedUDPPorts = [];
    logReversePathDrops = true;
    # my logs are being spammed by that mpd service already, pls stop
    logRefusedConnections = false;
  };
}
