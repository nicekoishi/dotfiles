{
  config,
  pkgs,
  ...
}: {
  boot.blacklistedKernelModules = ["i2c_nvidia_gpu"];

  hardware.nvidia = {
    package = let
      rcu_patch = pkgs.fetchpatch {
        url = "https://github.com/gentoo/gentoo/raw/c64caf53/x11-drivers/nvidia-drivers/files/nvidia-drivers-470.223.02-gpl-pfn_valid.patch";
        hash = "sha256-eZiQQp2S/asE7MfGvfe6dA/kdCvek9SYa/FFGp24dVg=";
      };
    in
      config.boot.kernelPackages.nvidiaPackages.mkDriver {
        version = "535.154.05";
        sha256_64bit = "sha256-fpUGXKprgt6SYRDxSCemGXLrEsIA6GOinp+0eGbqqJg=";
        sha256_aarch64 = "sha256-G0/GiObf/BZMkzzET8HQjdIcvCSqB1uhsinro2HLK9k=";
        openSha256 = "sha256-wvRdHguGLxS0mR06P5Qi++pDJBCF8pJ8hr4T8O6TJIo=";
        settingsSha256 = "sha256-9wqoDEWY4I7weWW05F4igj1Gj9wjHsREFMztfEmqm10=";
        persistencedSha256 = "sha256-d0Q3Lk80JqkS1B54Mahu2yY/WocOqFFbZVBh+ToGhaE=";

        patches = [rcu_patch];
      };
    # config.boot.kernelPackages.nvidiaPackages.production; # 550 is unusable as of 24/03/2024

    modesetting.enable = true;
    nvidiaSettings = false;
  };

  hardware.opengl = {
    extraPackages = with pkgs; [nvidia-vaapi-driver];
    extraPackages32 = with pkgs.pkgsi686Linux; [nvidia-vaapi-driver];
  };

  services.xserver.videoDrivers = ["nvidia"];
}
