{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (builtins) elem;
  inherit (lib.modules) mkIf;

  cfg = config.nice;
  dev = cfg.host;

  # NOTE: This is here because I can't be bothered to check if the driver works
  # after every update, so we update the rest of the system first and then this driver.
  nvPackage = config.boot.kernelPackages.nvidiaPackages.mkDriver {
    version = "570.86.16";
    sha256_64bit = "sha256-RWPqS7ZUJH9JEAWlfHLGdqrNlavhaR1xMyzs8lJhy9U=";
    sha256_aarch64 = "sha256-RiO2njJ+z0DYBo/1DKa9GmAjFgZFfQ1/1Ga+vXG87vA=";
    openSha256 = "sha256-DuVNA63+pJ8IB7Tw2gM4HbwlOh1bcDg2AN2mbEU9VPE=";
    settingsSha256 = "sha256-9rtqh64TyhDF5fFAYiWl3oDHzKJqyOW3abpcf2iNRT8=";
    persistencedSha256 = "sha256-3mp9X/oV8o2TH9720NnoXROxQ4g98nNee+DucXpQy3w=";
  };
in {
  config = mkIf (elem "nvidia" dev.gpu) {
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
        nvtopPackages.nvidia
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

        powerManagement = {
          enable = true;
          finegrained = false;
        };

        nvidiaPersistenced = true;

        # disabled until nvidia fixes itself (i.e prob after a year)
        open = lib.mkForce false;

        # weird fullscreen bug when trying to use fsr, so lets disable it
        forceFullCompositionPipeline = lib.mkForce false;

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
