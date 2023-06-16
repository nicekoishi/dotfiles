{pkgs, inputs,...}: {
  home.packages = with pkgs; [
    inputs.anyrun.packages.${pkgs.system}.anyrun
    eww-wayland
    hyprpicker
    swaynotificationcenter
    swww
  ];
}
