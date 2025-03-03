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
    version = "570.124.04";
    sha256_64bit = "sha256-G3hqS3Ei18QhbFiuQAdoik93jBlsFI2RkWOBXuENU8Q=";
    sha256_aarch64 = "sha256-HN58N00SNEwMQKSKuOMAXVW6J2VI/2YyDulQNJHuVeM=";
    openSha256 = "sha256-KCGUyu/XtmgcBqJ8NLw/iXlaqB9/exg51KFx0Ta5ip0=";
    settingsSha256 = "sha256-LNL0J/sYHD8vagkV1w8tb52gMtzj/F0QmJTV1cMaso8=";
    persistencedSha256 = "sha256-SHSdnGyAiRH6e0gYMYKvlpRSH5KYlJSA1AJXPm7MDRk=";
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
