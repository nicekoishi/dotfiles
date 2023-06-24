{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    inputs.anyrun.packages.${pkgs.system}.anyrun-with-all-plugins
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast

    eww-wayland
    hyprpicker
    swaynotificationcenter
    swww
  ];
}
