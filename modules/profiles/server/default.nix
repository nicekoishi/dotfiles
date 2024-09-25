{
  imports = [
    ./auth

    ./ddns.nix
    ./nginx.nix
    ./navidrome.nix
  ];

  nice.host.opts = {
    profiles = ["server"];
  };
}
