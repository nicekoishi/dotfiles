{
  imports = [
    ./environment
    ./hardware
    ./network
    ./programs
    ./services
  ];

  system.nixos.tags = ["desktop"];

  nice.host.opts = {
    roles = ["desktop"];
  };
}
