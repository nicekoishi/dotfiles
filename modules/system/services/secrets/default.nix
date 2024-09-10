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
