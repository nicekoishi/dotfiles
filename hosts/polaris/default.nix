{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
    kernelPackages = lib.mkForce pkgs.linuxPackages_cachyos;
  };

  environment.systemPackages = [pkgs.scx];

  services = {
    fstrim.enable = true;
    btrfs.autoScrub.enable = true;
  };
}
