{inputs, ...}: let
  system = "x86_64-linux";
in {
  environment.systemPackages = [
    inputs.arrpc.packages.${system}.arrpc

    # fufexan/nix-gaming
    inputs.nix-gaming.packages.${system}.wine-ge
    inputs.nix-gaming.packages.${system}.wine-tkg
    inputs.nix-gaming.packages.${system}.wine-discord-ipc-bridge
  ];
}
