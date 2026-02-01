{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (builtins) any;
  inherit (lib.modules) mkIf;
  inherit (lib.strings) hasPrefix;

  dev = config.nice.host;
in {
  config = mkIf (any (i: hasPrefix "amd" i) dev.gpu) {
    boot = {
      kernelParams = ["amdgpu"];
      initrd.kernelModules = ["amdgpu"];
    };

    hardware.graphics = {
      extraPackages = with pkgs; [
        mesa

        vulkan-tools
        vulkan-loader
        vulkan-validation-layers
        vulkan-extension-layer

        rocmPackages.clr
        rocmPackages.clr.icd
      ];
    };

    services.xserver.videoDrivers = ["modesetting" "amdgpu"];
  };
}
