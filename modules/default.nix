let
  roles = {
    "common" = [
      ./core

      ./nix
      ./programs
    ];
    "desktop" =
      roles."common"
      ++ [
        ./services

        ./services/system/avahi.nix
        ./services/system/earlyoom.nix
        ./services/system/greetd.nix
        ./services/system/network.nix
        ./services/system/pipewire.nix
        ./services/system/printing.nix
        ./services/system/udisks2.nix

        ./convenience
      ];
  };
in {
  _module.args = {inherit roles;};
}
