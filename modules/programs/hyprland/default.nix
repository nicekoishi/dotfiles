{
  inputs,
  pkgs,
  ...
}: let
  inherit (inputs) xdph;
in {
  # i really don't like messing with this...
  disabledModules = ["programs/hyprland.nix"];

  imports = [
    inputs.hyprland.nixosModules.default
  ];

  programs.hyprland = {
    enable = true;
    portalPackage = xdph.packages.${pkgs.system}.default;
  };
}
