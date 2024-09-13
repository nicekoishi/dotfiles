{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf mkMerge;
  inherit (lib.strings) versionAtLeast versionOlder;

  cfg = config.nice;
  dev = cfg.host;
  kver = config.boot.kernelPackages.kernel.version;
in {
  config = mkIf (dev.cpu == "amd") {
    environment.systemPackages = [pkgs.amdctl];

    hardware.cpu.amd.updateMicrocode = true;

    boot = mkMerge [
      {
        kernelModules = [
          "kvm-amd"
          "zenpower"
          "msr"
        ];
        blacklistedKernelModules = ["k10temp"];
        kernelParams = ["iommu=pt"];
        extraModulePackages = [config.boot.kernelPackages.zenpower];
      }

      # https://github.com/NixOS/nixos-hardware/blob/9fc19be21f0807d6be092d70bf0b1de0c00ac895/common/cpu/amd/pstate.nix
      (mkIf ((versionAtLeast kver "5.17") && (versionOlder kver "6.1")) {
        kernelParams = ["initcall_blacklist=acpi_cpufreq_init"];
        kernelModules = ["amd-pstate"];
      })

      (mkIf ((versionAtLeast kver "6.1") && (versionAtLeast kver "6.3")) {
        kernelParams = ["amd_pstate=passive"];
      })

      (mkIf (versionAtLeast kver "6.3") {
        kernelParams = ["amd-pstate=active"];
      })
    ];
  };
}
