{ inputs, ... }:
let
  system = "x86_64-linux";
in
{
  environment.systemPackages = [
    inputs.anyrun.packages.${system}.anyrun
    inputs.arrpc.packages.${system}.arrpc

    # contrib
    inputs.hypr-contrib.packages.${system}.grimblast

    # fufexan/nix-gaming
    inputs.nix-gaming.packages.${system}.wine-ge
    inputs.nix-gaming.packages.${system}.wine-tkg
    inputs.nix-gaming.packages.${system}.wine-discord-ipc-bridge
  ];
}
