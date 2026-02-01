{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (builtins) any elem;
  inherit (lib.modules) mkIf;
  inherit (lib.strings) hasPrefix;

  cfg = config.nice;
  dev = cfg.host;

  isHybrid = elem "nv-hybrid" dev.gpu;

  # NOTE: This is here because I can't be bothered to check if the driver works
  # after every update, so we update the rest of the system first and then this driver.
  nvPackage = config.boot.kernelPackages.nvidiaPackages.mkDriver {
    version = "590.48.01";
    sha256_64bit = "sha256-ueL4BpN4FDHMh/TNKRCeEz3Oy1ClDWto1LO/LWlr1ok=";
    sha256_aarch64 = "sha256-FOz7f6pW1NGM2f74kbP6LbNijxKj5ZtZ08bm0aC+/YA=";
    openSha256 = "sha256-hECHfguzwduEfPo5pCDjWE/MjtRDhINVr4b1awFdP44=";
    settingsSha256 = "sha256-NWsqUciPa4f1ZX6f0By3yScz3pqKJV1ei9GvOF8qIEE=";
    persistencedSha256 = "sha256-wsNeuw7IaY6Qc/i/AzT/4N82lPjkwfrhxidKWUtcwW8=";
  };
in {
  config = mkIf (any (hasPrefix "nv") dev.gpu) {
    boot = {
      blacklistedKernelModules = [
        # USB-C driver, my 1660 doesn't need it.
        "i2c_nvidia_gpu"

        "nouveau"
      ];

      kernelParams = [
        "nvidia_drm.fbdev=1"
        "nvidia.NVreg_EnableGpuFirmware=0"
      ];
    };

    environment = {
      sessionVariables = {
        LIBVA_DRIVER_NAME = "nvidia";
      };

      systemPackages = with pkgs; [
        mesa

        # vulkan
        vulkan-tools
        vulkan-loader
        vulkan-validation-layers
        vulkan-extension-layer

        # libva
        libva
        libva-utils
      ];
    };

    hardware = {
      nvidia = {
        package = nvPackage;
        modesetting.enable = true;
        open = true;
        nvidiaPersistenced = true;

        powerManagement = {
          enable = true;
          finegrained = false;
        };

        prime.offload = {
          enable = isHybrid;
          enableOffloadCmd = isHybrid;
        };

        # useless
        nvidiaSettings = false;
      };

      graphics = {
        extraPackages = with pkgs; [nvidia-vaapi-driver];
        extraPackages32 = with pkgs.pkgsi686Linux; [nvidia-vaapi-driver];
      };
    };

    services.xserver.videoDrivers = ["nvidia"];
  };
}
