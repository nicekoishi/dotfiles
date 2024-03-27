let
  desktop = [
    ./core/boot.nix
    ./core/opengl.nix

    ./core
    ./services

    ./services/system/avahi.nix
    ./services/system/greetd.nix
    ./services/system/network.nix
    ./services/system/pipewire.nix
    ./services/system/printing.nix
    ./services/system/udisks2.nix

    ./nix
    ./programs
    ./convenience
  ];
in {
  _module.args = {inherit desktop;};
}
