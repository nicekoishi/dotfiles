{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf mkMerge;
  inherit (lib.strings) versionAtLeast;

  kver = config.boot.kernelPackages.kernel.version;
in {
  environment.systemPackages = [pkgs.amdctl];

  hardware.cpu.amd.updateMicrocode = true;

  boot = mkMerge [
    {
      kernelModules = [
        "kvm-amd"
        "amd-pstate"
        "zenpower"
        "msr"
      ];
      kernelParams = ["iommu=pt"];
      extraModulePackages = [config.boot.kernelPackages.zenpower];
    }

    (mkIf (versionAtLeast kver "6.3") {
      kernelParams = ["amd-pstate=active"];
    })
  ];
}
