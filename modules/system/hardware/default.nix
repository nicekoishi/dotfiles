{lib, ...}: {
  imports = [
    ./cpu
    ./video
    ./audio
  ];

  # it would be funny, they said
  hardware.enableRedistributableFirmware = lib.mkDefault true;
}
