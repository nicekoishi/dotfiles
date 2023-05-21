{ config, lib, pkgs, ... }:

{
  imports = [ ./hardware.nix ];
  # no one fears it anymore
  networking.hostName = "polaris";

  ## Bootloader
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    initrd.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
    initrd.systemd.enable = true;
    blacklistedKernelModules = [ "i2c_nvidia_gpu" ];
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
    supportedFilesystems = [ "ntfs" ];
    loader.efi.canTouchEfiVariables = true;
    loader.systemd-boot = {
      enable = true;
      configurationLimit = 12;
      consoleMode = "max";
    };

    plymouth = {
      enable = true;
      theme = "nixos-bgrt";
      themePackages = [ pkgs.nixos-bgrt-plymouth ];
    };
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
    };
    nvidia.package = config.boot.kernelPackages.nvidiaPackages.latest;
    nvidia.modesetting.enable = true;
  };
  services.xserver.videoDrivers = [ "nvidia" ];

  ## smth smth nix flakes, forgot #TODO: try sticking some ram in my brain to expand capacity
  nix.settings = {
    experimental-features = [" nix-command" "flakes" ];
    substituters = [
      "https://hyprland.cachix.org"
      "https://nix-gaming.cachix.org"
    ];
    trusted-public-keys = [
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
    ];
  };
  nixpkgs = {
    config.allowUnfree = true;
  };
  nix = {
    optimise.automatic = true;
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';

  };

  ## if i forgot this, it would be annoying at least
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.openssh = {
    enable = true;
    settings.passwordAuthentication = false;
    settings.kbdInteractiveAuthentication = false;
    settings.permitRootLogin = "no";
  };

  ## Keymap
  services.xserver = {
    layout = "br";
    xkbVariant = "";
  };

  ## Sound
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  system.stateVersion = "23.05";
}
