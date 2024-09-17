{lib, ...}: let
  inherit (lib.options) mkEnableOption;
in {
  options.nice.host = {
    services = {
      nginx.enable = mkEnableOption "nginx, all-in-one load balancer, content cache, and web server";

      navidrome.enable = mkEnableOption "Navidrome, self-hosted music server";
    };
  };
}
