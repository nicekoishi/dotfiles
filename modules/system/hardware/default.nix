{lib, ...}: {
  imports = [
    ./cpu
    ./gpu
    ./audio
  ];

  # it would be funny, they said
  hardware.enableRedistributableFirmware = lib.mkDefault true;
}
