{
  boot = {
    initrd.kernelModules = ["lz4" "z3fold"];

    kernelParams = [
      "zswap.enabled=1"
      "zswap.compressor=lz4"
      "zswap.zpool=z3fold"
    ];
  };
}
