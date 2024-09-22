# NOTE: this is just the module configuration, for the actual secrets go back
# ${self}/secrets is for the agenix cli tool only
{self, ...}: {
  age.secrets = {
    tailscale-key = {
      file = "${self}/secrets/tailscale.age";
      owner = "supeen";
      group = "users";
      mode = "400";
    };

    cloudflare-dns = {
      file = "${self}/secrets/cloudflare-dns.age";
      owner = "root";
      group = "root";
      mode = "400";
    };

    kanidm-admin = {
      file = "${self}/secrets/kanidm-admin.age";
      owner = "kanidm";
      group = "kanidm";
      mode = "400";
    };

    kanidm-idm-admin = {
      file = "${self}/secrets/kanidm-idm-admin.age";
      owner = "kanidm";
      group = "kanidm";
      mode = "400";
    };

    navidrome-env = {
      file = "${self}/secrets/navidrome.age";
      owner = "navidrome";
      group = "root";
      mode = "400";
    };
  };
}
