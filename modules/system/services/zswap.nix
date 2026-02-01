{
  config = {
    boot = {
      initrd.kernelModules = ["lz4" "zsmalloc"];

      kernelParams = [
        "zswap.enabled=1"
        "zswap.compressor=lz4"
        "zswap.zpool=zmalloc"
      ];
    };
  };
}
