{lib, ...}: let
  inherit (lib.modules) mkDefault;
in {
  imports = [
    ./boot
    ./environment
    ./hardware
    ./networking
    ./programs
    ./security
    ./services
  ];

  system.stateVersion = mkDefault "23.11";
}
