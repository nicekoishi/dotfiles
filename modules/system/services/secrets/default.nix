# NOTE: this is just the module configuration, for the actual secrets go back
# ${self}/secrets is for the agenix cli tool only
{
  # config,
  lib,
  self,
  ...
}: let
  inherit (lib.modules) mkIf;

  mkSecret = cond: {
    file,
    owner ? "root",
    group ? "root",
    mode ? "400",
  }:
    mkIf cond {
      inherit file owner group mode;
    };
  # cfg = config.nice.host;
  # srv = cfg.services;
in {
  age.secrets = {
    tailscale-key = mkSecret true {
      file = "${self}/secrets/tailscale.age";
      owner = "supeen";
      group = "users";
    };

    #cloudflare-dns = mkSecret srv.nginx.enable {
    #  file = "${self}/secrets/cloudflare-dns.age";
    #};

    #kanidm-admin = mkSecret srv.kanidm.enable {
    #  file = "${self}/secrets/kanidm-admin.age";
    #  owner = "kanidm";
    #  group = "kanidm";
    #};

    #kanidm-idm-admin = mkSecret srv.kanidm.enable {
    #  file = "${self}/secrets/kanidm-idm-admin.age";
    #  owner = "kanidm";
    #  group = "kanidm";
    #};

    #navidrome-env = mkSecret srv.navidrome.enable {
    #  file = "${self}/secrets/navidrome.age";
    #  owner = "navidrome";
    #};
  };
}
