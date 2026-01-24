{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (config.nice.host.opts) roles;
in {
  config = mkIf (builtins.elem "desktop" roles) {
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
