{
  # TODO: what if the next host is intel?
  imports = [./amd];

  services.power-profiles-daemon.enable = true;
}
