{config,pkgs,...}:

{
  ## Bootloader
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
    supportedFilesystems = [ "ntfs" ];
    loader.efi.canTouchEfiVariables = true;
    loader.systemd-boot = {
      enable = true;
      configurationLimit = 12;
      consoleMode = "max";
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

  ## Keymap
  services.xserver = {
    layout = "br";
    xkbVariant = "";
  };

  ## Networking
  networking = {
    hostName = "nixos";
    firewall = {
      enable = true;
      allowPing = true;
      allowedTCPPorts = [ 80 443 5357 445 139 ];
      allowedUDPPorts = [ 3702 137 138 ];
    };
  };

  services.samba.openFirewall = true;

  # Virtual Machines
  programs.dconf.enable = true;
  services.spice-vdagentd.enable = true;
  virtualisation = {
    libvirtd = {
      enable = true;
    };
    spiceUSBRedirection.enable = true;
  };

  ## Disk Optimizations
  services.btrfs = {
    autoScrub.enable = true;
  };
  services.fstrim = {
    enable = true;
  };

  ## zram because why not (needs newer kernel)
  zramSwap.enable = true;

  ## Printing
  services.printing = {
    enable = true;
    drivers = [ pkgs.hplipWithPlugin ];
  };

  ## Scanning
  hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.hplipWithPlugin ];
  };

  ## Sound
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
  };
}
