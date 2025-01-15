{
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/ROOT";
      fsType = "btrfs";
      options = ["subvol=@" "compress=zstd" "noatime" "ssd"];
    };
    "/home" = {
      device = "/dev/disk/by-label/ROOT";
      fsType = "btrfs";
      options = ["subvol=@home" "compress=zstd" "noatime" "ssd"];
    };

    "/nix" = {
      device = "/dev/disk/by-label/ROOT";
      fsType = "btrfs";
      options = ["subvol=@nix" "compress=zstd" "noatime" "ssd"];
    };

    "/boot" = {
      device = "/dev/disk/by-label/BOOT";
      fsType = "vfat";
    };
  };

  # NOTE: Remember when I put /dev/disk/by-label/ on device? No? Yes, that was dumb.
  swapDevices = [{label = "SWAP";}];
}
