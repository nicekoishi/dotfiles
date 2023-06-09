# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{
  config,
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = ["xhci_pci" "ahci" "usbhid" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelModules = ["kvm-amd"];
  boot.extraModulePackages = [];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/53a6817a-f360-4aa1-87b0-628101865175";
    fsType = "btrfs";
    options = ["subvol=@"];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/53a6817a-f360-4aa1-87b0-628101865175";
    fsType = "btrfs";
    options = ["subvol=@nix"];
  };

  fileSystems."/var/log" = {
    device = "/dev/disk/by-uuid/53a6817a-f360-4aa1-87b0-628101865175";
    fsType = "btrfs";
    options = ["subvol=@log"];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/53a6817a-f360-4aa1-87b0-628101865175";
    fsType = "btrfs";
    options = ["subvol=@home"];
  };

  fileSystems."/var/cache" = {
    device = "/dev/disk/by-uuid/53a6817a-f360-4aa1-87b0-628101865175";
    fsType = "btrfs";
    options = ["subvol=@cache"];
  };

  fileSystems."/var/lib/libvirt/images" = {
    device = "/dev/disk/by-uuid/53a6817a-f360-4aa1-87b0-628101865175";
    fsType = "btrfs";
    options = ["subvol=@images"];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/0DF1-637F";
    fsType = "vfat";
  };

  swapDevices = [];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eno1.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp5s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
