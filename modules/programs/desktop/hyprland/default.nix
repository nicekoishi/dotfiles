{
  inputs,
  pkgs,
  ...
}: {
  # it really didn't go well
  imports = [
    inputs.hyprland.nixosModules.default
  ];

  programs.hyprland = {
    enable = true;
    portalPackage = inputs.xdph.packages."${pkgs.system}".xdg-desktop-portal-hyprland;
  };
}
