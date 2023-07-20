{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    inputs.hypr-contrib.packages.${pkgs.system}.grimblast

    eww-wayland
    hyprpicker
    swaynotificationcenter
    swww
  ];
}
