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

        dnsProvider = "cloudflare";
        dnsPropagationCheck = true;
        environmentFile = config.age.secrets.cloudflare-dns.path;

        # NOTE: Do not forget to enable this when testing, we don't want to get rate limited again
        server = "https://acme-staging-v02.api.letsencrypt.org/directory";
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
