{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf mkForce;
  inherit (lib.strings) toInt;

  # NOTE: Should these be moved to our module system?
  DataDirectory = "/var/lib/navidrome";
  Address = "127.0.0.1";
  Port = "4553";

  cfg = config.nice.host;
  srv = cfg.services;
  domain = "navi.nicekoishi.com.br";
in {
  # FIXME: Scrobble to Last.fm is broken at the moment
  # Relevant error from journalctl -e SYSLOG_IDENTIFIER=navidrome:
  # dial tcp: lookup ws.audioscrobbler.com: device or resource busy"
  config = mkIf srv.navidrome.enable {
    nice.host.services = {
      nginx.enable = true;

      ddns.cloudflare = [domain];
    };

    security.acme.certs."${domain}" = {
      dnsProvider = "cloudflare";
      dnsResolver = "1.1.1.1:53";
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
          ScanSchedule = "0 * * * *"; # at every hour
          SessionTimeout = "1h"; # ignored by most clients, only works on web client
          TranscodingCacheSize = "100MB";
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
      serviceConfig = {
        # https://github.com/NixOS/nixpkgs/issues/151550
        # How is this not fixed on the module already?
        BindReadOnlyPaths = [config.environment.etc."resolv.conf".source];

        EnvironmentFile = config.age.secrets.navidrome-env.path;
        ProtectHome = mkForce "read-only"; # i really don't like this...
      };
    };
  };
}
