{
  imports = [
    ./hardware
    ./networking
    ./programs
    ./services
  ];

  # As "desktop" is a role, it can populate `system.nixos.tags`
  system.nixos.tags = ["desktop"];

  # But we set it here too, just in case
  nice.host.opts = {
    roles = ["desktop"];
  };
}
