{lib, ...}: {
  imports = [
    ./cpu
  ];

  # it would be funny, they said
  hardware.enableRedistributableFirmware = lib.mkDefault true;
}
