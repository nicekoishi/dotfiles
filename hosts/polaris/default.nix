{
  imports = [
    ./hardware-configuration.nix
  ];

  services.fstrim.enable = true;
  services.btrfs.autoScrub.enable = true;
}
