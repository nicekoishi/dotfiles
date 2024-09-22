{lib, ...}: let
  inherit (lib.options) mkEnableOption mkOption;
  inherit (lib.types) listOf str;
in {
  options.nice.host = {
    services = {
      nginx.enable = mkEnableOption "nginx, all-in-one load balancer, content cache, and web server";

      navidrome.enable = mkEnableOption "Navidrome, self-hosted music server";

      kanidm.enable = mkEnableOption "Kanidm, simple and secure identity management platform";

      ddns = {
        cloudflare = mkOption {
          default = [];
          type = listOf str;
          description = ''
            Cloudflare domains to be updated by ddclient.
          '';
        };
      };
    };
  };
}
