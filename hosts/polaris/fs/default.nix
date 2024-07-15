{
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/418e6ca3-9b74-4cbf-9599-f237a39d931d";
      fsType = "btrfs";
      options = ["subvol=@" "compress=zstd" "noatime" "ssd"];
    };
    "/home" = {
      device = "/dev/disk/by-uuid/418e6ca3-9b74-4cbf-9599-f237a39d931d";
      fsType = "btrfs";
      options = ["subvol=@home" "compress=zstd" "noatime" "ssd"];
    };

    "/nix" = {
      device = "/dev/disk/by-uuid/418e6ca3-9b74-4cbf-9599-f237a39d931d";
      fsType = "btrfs";
      options = ["subvol=@nix" "compress=zstd" "noatime" "ssd"];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/A807-E933";
      fsType = "vfat";
    };
  };

  swapDevices = [];
}
