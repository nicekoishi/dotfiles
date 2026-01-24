{lib, ...}: let
  inherit (lib.modules) mkDefault;
in {
  imports = [
    ./boot
    ./environment
    ./hardware
    ./network
    ./programs
    ./security
    ./services
  ];

  system.stateVersion = mkDefault "25.11";
}
