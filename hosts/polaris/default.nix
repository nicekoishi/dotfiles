{
  imports = [
    ./fs
    ./modules

    ./networking.nix
  ];

  nice.host = {
    cpu = "amd";
    gpu = ["nvidia"];

    opts.waylandReady = true;
  };
}
