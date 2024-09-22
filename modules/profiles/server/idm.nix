{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;

  certs = config.security.acme.certs."${domain}";

  # don't you dare
  domain = "kani.nicekoishi.com.br";
  Address = "127.0.0.1";
  Port = "8433";

  cfg = config.nice.host;
  srv = cfg.services;
in {
  config = mkIf srv.kanidm.enable {
    nice.host.services = {
      nginx.enable = true;

      # Maybe I shouldn't be doing that...
      ddns.cloudflare = [domain];
    };

    # This is dumb, why it isn't reading from defaults?
    # Anyway, this forces us to go back to useACMEHost
    security.acme.certs."${domain}" = {
      dnsProvider = "cloudflare";
      dnsResolver = "1.1.1.1:53";
    };

    services = {
      kanidm = {
        package = pkgs.kanidm.withSecretProvisioning;
        enableServer = true;

        serverSettings = {
          inherit domain;
          origin = "https://${domain}";
          bindaddress = "${Address}:${Port}";
          trust_x_forward_for = true;
          tls_chain = "${certs.directory}/fullchain.pem";
          tls_key = "${certs.directory}/key.pem";

          online_backup = {
            path = "/var/lib/kanidm/backups"; # should this be a non default path?
            schedule = "0 4 * * *"; # at every day at 4 AM
          };
        };

        # We're only doing this for admin accounts, as we need them to start the service
        # Other users shouldn't be added here, even if it supports it
        provision = {
          enable = true;
          idmAdminPasswordFile = config.age.secrets.kanidm-idm-admin.path;
          adminPasswordFile = config.age.secrets.kanidm-admin.path;
        };
      };

      nginx.virtualHosts."${domain}" = {
        useACMEHost = "${domain}";
        forceSSL = true;

        locations."/".proxyPass = "https://${Address}:${Port}";
      };
    };

    # https://github.com/NotAShelf/nyx/blob/d407b4d6e5ab7f60350af61a3d73a62a5e9ac660/modules/core/roles/server/system/services/kanidm.nix#L33
    # This way we shouldn't need to define `tls_chain` and `tls_key`.
    # SupplementaryGroups is needed as kanidm couldn't read the certificates otherwise
    # FIXME: Kanidm module's assertion tries to access tls_chain and tls_key, so we still have to defined them under serverSettings.
    systemd.services.kanidm = {
      after = ["acme-finished-${domain}.target"];
      serviceConfig = {
        SupplementaryGroups = [certs.group];
        BindReadOnlyPaths = [
          # when using tls_chain and tls_key, it's already added
          certs.directory

          # why tho?
          config.age.secrets.kanidm-idm-admin.path
          config.age.secrets.kanidm-admin.path
        ];
      };
    };
  };
}
