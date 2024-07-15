{lib, ...}: {
  imports = [
    ./cpu
    ./audio
    ./video
  ];

  # it would be funny, they said
  hardware.enableRedistributableFirmware = lib.mkDefault true;
}
