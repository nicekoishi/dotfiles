# let
#  supeen = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMt/fj0+1c7Ktr9WQCqYHoi3jWSxV8/cwEUaT/92DA7q";
# in
{
  # NOTE: move to separate folders if more than one!
  age.secrets = {
    tailscale-key = {
      file = ./tailscale.age;
      owner = "supeen";
      group = "users";
      mode = "400";
    };
  };
}
