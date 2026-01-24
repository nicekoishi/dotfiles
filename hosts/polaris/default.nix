{
  imports = [
    ./fs
    ./modules
    ./network.nix
  ];

  nice.host = {
    cpu = "amd";
    gpu = ["nvidia"];

    opts.waylandReady = true;
  };
}
