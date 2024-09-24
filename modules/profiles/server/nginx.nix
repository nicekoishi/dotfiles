{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkDefault mkIf;

  cfg = config.nice.host;
  srv = cfg.services;
in {
  config = mkIf srv.nginx.enable {
    security.acme = {
      acceptTerms = true;

      # This defaults to cloudflare, if a new domain is from another provider...
      # just override these defaults with `security.acme.certs."${domain}"`
      defaults = {
        email = "domain.koish@gmail.com";

        dnsPropagationCheck = true;
        environmentFile = config.age.secrets.cloudflare-dns.path;

        # NOTE: Do not forget to enable this when testing, we don't want to get rate limited again
        # server = "https://acme-staging-v02.api.letsencrypt.org/directory";
      };
    };

    services = {
      nginx = {
        enable = true;
        statusPage = true; # localhost/nginx_status
        clientMaxBodySize = mkDefault "2m";

        recommendedBrotliSettings = true;
        recommendedGzipSettings = true;
        recommendedOptimisation = true;
        recommendedProxySettings = true;
        recommendedTlsSettings = true;
        recommendedZstdSettings = true;

        # https://nixos.wiki/wiki/Nginx
        # This is probably really basic, and it can be improved upon
        commonHttpConfig = ''
          # Add HSTS header with preloading to HTTPS requests
          # Adding this header to HTTP requests is discouraged
          map $scheme $hsts_header {
            https "max-age=31536000; includeSubdomains; preload";
          }

          # Adds the Referrer-Policy header with the value "no-referrer"
          # See: https://developer.mozilla.org/en-US/docs/Web/Security/Referer_header:_privacy_and_security_concerns
          add_header "Referrer-Policy" "no-referrer";

          # Adds the Strict-Transport-Security header with a value derived from the mapped HSTS header.
          # See: https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Strict-Transport-Security
          # https://github.com/NotAShelf/nyx/blob/440441c19369763fbd512e71bb61807fce27e3c0/modules/core/roles/server/system/services/nginx.nix#L68
          add_header Strict-Transport-Security $hsts_header;

          # Couldn't find the exact source, but here is the oldest I found:
          # https://dawnbringer.net/blog/901/nginx_ip_masking_anonymize_ip-logging
          # This defines a new map that anonymize $remote_addr, replacing the last
          # octet of IPv4 addresses and taking leaving only two segments of IPv6 addresses
          # 192.168.1.10 -> 192.168.1.0
          # 2001:0db8:... -> 2001:0db8::
          map $remote_addr $remote_addr_anon {
            ~(?P<ip>\d+\.\d+\.\d+)\.    $ip.0;
            ~(?P<ip>[^:]+:[^:]+):       $ip::;
            default                     0.0.0.0;
          }

          # Define a new map that censors url query strings that have paramaters with sensitive info
          # This will censor the entire url, so it should only be used for logging purposes!
          # We could set multiple if's here, though...
          map $request_uri $request_uri_anon {
            ~[?&](t|s|p|jwt|api_key)=         "[REDACTED]";
            default                           $request_uri;
          }

          # Define a log format anon that closely follows combined, but instead anonymizing $remote_addr.
          # This also attempts to anonymize any sensitive information sent using GET, like Navidrome.
          log_format anon '$remote_addr_anon - $remote_user [$time_local] '
                          '"$request_method $request_uri_anon $server_protocol" $status $body_bytes_sent '
                          '"$http_referer" "$http_user_agent"';

          access_log /var/log/nginx/access.log anon;

          proxy_cookie_path / "/; secure; HttpOnly; SameSite=strict";
        '';
      };

      fail2ban.jails = {
        nginx-bad-request.settings.enabled = true;
        nginx-http-auth.settings.enabled = true;
        nginx-botsearch.settings.enabled = true;
      };
    };

    users.users.nginx.extraGroups = ["acme"];
  };
}
