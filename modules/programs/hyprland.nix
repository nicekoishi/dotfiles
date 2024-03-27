{
  inputs,
  pkgs,
  ...
}: let
  inherit (inputs) xdph;
in {
  imports = [
    ../../environment/hyprland
    ../services/user/polkit-gnome.nix
  ];
  environment.variables.NIXOS_OZONE_WL = "1";

  programs.hyprland = {
    enable = true;
    portalPackage = xdph.packages.${pkgs.system}.default;
  };
}
