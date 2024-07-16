{
  inputs,
  inputs',
  ...
}: {
  # it really didn't go well
  imports = [
    inputs.hyprland.nixosModules.default
  ];

  programs.hyprland = {
    enable = true;
    portalPackage = inputs'.xdph.packages.xdg-desktop-portal-hyprland;
  };
}
