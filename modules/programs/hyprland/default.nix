{
  inputs,
  pkgs,
  ...
}: let
  inherit (inputs) xdph;
in {
  programs.hyprland = {
    enable = true;
    portalPackage = xdph.packages.${pkgs.system}.default;
  };
}
