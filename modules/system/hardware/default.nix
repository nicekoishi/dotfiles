{lib, ...}: {
  imports = [
    ./cpu
    ./gpu
    ./audio

    ./bluetooth.nix
  ];

  # it would be funny, they said
  hardware.enableRedistributableFirmware = lib.mkDefault true;
}
