{config, lib, pkgs, inputs, ... }:

{
  environment.systemPackages = [
    inputs.arrpc.packages.x86_64-linux.arrpc
  ];
}
