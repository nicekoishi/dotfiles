{
  imports = [
    ./fs
    ./modules
    ./network.nix
  ];

  nice.host = {
    cpu = "amd";
    gpu = ["amd"];

    opts = {
      capabilities = {
        audio = true;
        waylandReady = true;
      };
    };
  };
}
