{config, lib,pkgs, inputs, ...}:

{
  environment.systemPackages = [
    inputs.anyrun.packages.x86_64-linux.anyrun
  ];
}
