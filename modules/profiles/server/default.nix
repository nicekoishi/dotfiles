{
  imports = [
    ./ddns.nix
    ./idm.nix
    ./nginx.nix
    ./navidrome.nix
  ];

  system.nixos.tags = ["server"];
}
