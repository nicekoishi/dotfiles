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

  nvPackage = config.boot.kernelPackages.nvidiaPackages.mkDriver {
    version = "565.57.01";
    openSha256 = "sha256-/tM3n9huz1MTE6KKtTCBglBMBGGL/GOHi5ZSUag4zXA=";
    persistencedSha256 = "sha256-hdszsACWNqkCh8G4VBNitDT85gk9gJe1BlQ8LdrYIkg=";
    settingsSha256 = "sha256-H7uEe34LdmUFcMcS6bz7sbpYhg9zPCb/5AmZZFTx1QA=";
    sha256_64bit = "sha256-buvpTlheOF6IBPWnQVLfQUiHv4GcwhvZW3Ks0PsYLHo=";
    sha256_aarch64 = "sha256-aDVc3sNTG4O3y+vKW87mw+i9AqXCY29GVqEIUlsvYfE=";
  };
in {
  config = mkIf (elem "nvidia" dev.gpu) {
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
        # it didn't help, as it was a hyprland problem. one day it will be fixed
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
