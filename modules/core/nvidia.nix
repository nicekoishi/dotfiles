{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (lib.strings) versionOlder;
  nvBeta = config.boot.kernelPackages.nvidiaPackages.beta;
  nvStable = config.boot.kernelPackages.nvidiaPackages.stable;

  nvPackage =
    if (versionOlder nvBeta.version nvStable.version)
    then nvStable
    else nvBeta;
in {
  boot = {
    blacklistedKernelModules = ["i2c_nvidia_gpu" "nouveau"];
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
}
