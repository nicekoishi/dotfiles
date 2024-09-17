{
  imports = [
    ./nginx.nix
    ./navidrome.nix
  ];

  system.nixos.tags = ["server"];
}
