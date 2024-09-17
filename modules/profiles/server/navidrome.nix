{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf mkForce;
  inherit (lib.strings) toInt;

  DataDirectory = "/var/lib/navidrome";
  Address = "100.64.146.49"; # FIXME: is this dumb? probably
  Port = "4553";

  domain = "navi.nicekoishi.com.br";
in {
  # FIXME: Scrobble to Last.fm is broken at the moment
  # Relevant error from journal:
  # dial tcp: lookup ws.audioscrobbler.com: device or resource busy"
  config = mkIf (config.networking.hostName == "polaris") {
    nice.host.services = {
      nginx.enable = true;
    };

    # keep this here if I forget for some reason
    # security.acme.defaults.server = "https://acme-staging-v02.api.letsencrypt.org/directory";

    security.acme.certs."${domain}" = {
      credentialsFile = config.age.secrets.cloudflare-dns.path;
      dnsProvider = "cloudflare";
      dnsResolver = "1.1.1.1:53";
      dnsPropagationCheck = true;
    };

    services = {
      navidrome = {
        enable = true;
        openFirewall = true;
        user = "navidrome";
        group = "navidrome";

        settings = {
          inherit Address DataDirectory;
          CacheFolder = "${DataDirectory}/cache";
          Port = toInt Port;

          CoverArtPriority = "embedded,cover.*,folder.*,front.*,external";
          DefaultTheme = "Catppuccin Macchiato";
          MaxSidebarPlaylists = "10";
          MusicFolder = "${config.users.users.supeen.home}/Music";
          ScanSchedule = "0 4 * * 0"; # at every 4 AM on Sunday
          SessionTimeout = "1h";
          TranscodingCacheSize = "100MB";

          # This will probably be gone when I set up an identity provider
          UIWelcomeMessage = "Hello there!";
        };
      };

      nginx.virtualHosts."${domain}" = {
        useACMEHost = "${domain}";
        forceSSL = true;

        locations."/" = {
          proxyPass = "http://${Address}:${Port}";
          proxyWebsockets = true;
        };
      };
    };

    systemd.services.navidrome = {
      after = ["network.target" "tailscale-autoconnect.service"];
      wants = ["network.target" "tailscale-autoconnect.service"];

      serviceConfig = {
        EnvironmentFile = config.age.secrets.navidrome-env.path;
        ProtectHome = mkForce "read-only"; # i really don't like this...
      };
    };
  };
}
