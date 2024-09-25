{
  imports = [
    ./aagl
    ./steam

    ./gamemode.nix
  ];

  nice.host.opts = {
    profiles = ["gaming"];
  };
}
