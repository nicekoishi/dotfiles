{
  imports = [
    ./fs
    ./modules
    ./network.nix
  ];

  nice.host = {
    cpu = "amd";
    gpu = ["amd-hybrid" "nv-hybrid"];

    opts.waylandReady = true;
  };
}
