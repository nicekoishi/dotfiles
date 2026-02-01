{
  imports = [
    ./fs
    ./modules
    ./network.nix
  ];

  nice.host = {
    cpu = "amd";
    gpu = ["amd-hybrid" "nv-hybrid"];

    opts = {
      capabilities = {
        audio = true;
        waylandReady = true;
      };
    };
  };
}
