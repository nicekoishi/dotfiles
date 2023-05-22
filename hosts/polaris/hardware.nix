{ config, pkgs, ... }:

{
  # no one fears it anymore
  networking.hostName = "polaris";

  ## Bootloader
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 12;
    consoleMode = "max";
  };

  ## BTRFS needs this for compression
  fileSystems = {
    "/".options = [ "compress=zstd" "noatime" "ssd" "defaults" ];
    "/home".options = [ "compress=zstd" "noatime" "ssd" "defaults" ];
    "/nix".options = [ "compress=zstd" "noatime" "ssd" "defaults" ];
    "/var/cache".options = [ "compress=zstd" "noatime" "ssd" "defaults" ];
    "/var/log".options = [ "compress=zstd" "noatime" "ssd" "defaults" ];
    "/var/lib/libvirt/images".options = [ "compress=zstd" "noatime" "ssd" "defaults" ];
  };

  ## Graphics
  hardware = {
    opengl = {
      enable = true;
      extraPackages = with pkgs; [ nvidia-vaapi-driver ];
      driSupport32Bit = true;
    };
    nvidia.package = config.boot.kernelPackages.nvidiaPackages.latest;
    nvidia.modesetting.enable = true;
  };
  services.xserver.videoDrivers = [ "nvidia" ];
}
