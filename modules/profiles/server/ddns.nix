{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (lib.strings) concatStringsSep;

  cfg = config.nice.host;
  srv = cfg.services;
in {
  config = mkIf srv.nginx.enable {
    services.ddclient = {
      enable = true;

      configFile = pkgs.writeText "ddclient.conf" ''
        cache="/var/lib/ddclient/ddclient.cache"
        foreground=YES
        ssl=YES
        wildcard=YES
        usev4=webv4, webv4=ipify-ipv4
        usev6=webv6, webv6=ipify-ipv6

        protocol=cloudflare, \
        zone=nicekoishi.com.br, \
        login=token, \
        password_env=CLOUDFLARE_DNS_API_TOKEN, \
        ${concatStringsSep "," srv.ddns.cloudflare}
      '';
    };

    systemd.services.ddclient.serviceConfig = {
      EnvironmentFile = config.age.secrets.cloudflare-dns.path;
    };
  };
}
