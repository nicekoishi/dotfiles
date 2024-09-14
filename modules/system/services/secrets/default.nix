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
  };
}
