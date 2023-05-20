{ config, inputs, lib, pkgs, ... }:
let
  system = "x86_64-linux";
in
{
  environment.systemPackages = [
    inputs.anyrun.packages.${system}.anyrun
    inputs.arrpc.packages.${system}.arrpc
  ];
}
