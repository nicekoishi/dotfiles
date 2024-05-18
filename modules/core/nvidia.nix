{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit (lib.strings) versionOlder;
  nvBeta = config.boot.kernelPackages.nvidiaPackages.beta;
  nvStable = config.boot.kernelPackages.nvidiaPackages.stable;

  # FIXME: 555.42.02 is not on nixos-unstable 24/05/2024
  nvPackage =
    if (versionOlder nvBeta.version nvStable.version)
    then nvStable
    else nvBeta;
in {
  boot.blacklistedKernelModules = ["i2c_nvidia_gpu" "nouveau"];

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

  hardware.nvidia = {
    package = nvPackage;

    modesetting.enable = true;

    powerManagement = {
      enable = true;
      finegrained = false;
    };

    nvidiaPersistenced = true;

    # 555 fixed most of the bugs with suspend, but they still happen sometimes
    open = true;

    # not need anymore
    forceFullCompositionPipeline = false;

    # useless
    nvidiaSettings = false;
  };

  hardware.opengl = {
    extraPackages = with pkgs; [nvidia-vaapi-driver];
    extraPackages32 = with pkgs.pkgsi686Linux; [nvidia-vaapi-driver];
  };

  services.xserver.videoDrivers = ["nvidia"];
}
