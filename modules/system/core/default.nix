{lib, ...}: let
  inherit (lib.modules) mkDefault;
in {
  imports = [
    ./boot
    ./security
    ./environment
  ];

  system.stateVersion = mkDefault "23.11";
}
