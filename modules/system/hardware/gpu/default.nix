{pkgs, ...}: {
  imports = [
    ./nvidia
    ./amd
  ];

  hardware.graphics = {
    enable = true;
    # remember to not blindly copy and paste stuff from others,
    # dumb moment
    enable32Bit = true;
  };

  environment.systemPackages = [pkgs.nvtopPackages.full];
}
