{
  imports = [
    ./ddns.nix
    ./nginx.nix
    ./navidrome.nix
  ];

  system.nixos.tags = ["server"];
}
