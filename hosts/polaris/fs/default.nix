{
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/ROOT";
      fsType = "btrfs";
      options = ["subvol=@" "compress=zstd" "noatime"];
    };
    "/home" = {
      device = "/dev/disk/by-label/ROOT";
      fsType = "btrfs";
      options = ["subvol=@home" "compress=zstd" "noatime"];
    };
    "/nix" = {
      device = "/dev/disk/by-label/ROOT";
      fsType = "btrfs";
      options = ["subvol=@nix" "compress=zstd" "noatime"];
    };
    "/boot" = {
      device = "/dev/disk/by-label/BOOT";
      fsType = "vfat";
    };
  };
  swapDevices = [{label = "SWAP";}];
}
