{
  inputs,
  pkgs,
  ...
}: let
  inherit (inputs) xdph;
in {
  imports = [
    ../../environment/wayland
    ../services/user/polkit-gnome.nix
  ];

  programs.hyprland = {
    enable = true;
    portalPackage = xdph.packages.${pkgs.system}.default;
  };
}
