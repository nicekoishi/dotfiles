{
  inputs,
  pkgs,
  ...
}: let
  inherit (inputs) xdph;
in {
  imports = [
    ../../../environment/wayland
    ../../services/user/polkit-gnome
  ];

  programs.hyprland = {
    enable = true;
    portalPackage = xdph.packages.${pkgs.system}.default;
  };
}
