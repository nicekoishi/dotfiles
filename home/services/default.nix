{
  inputs',
  pkgs,
  ...
}: {
  imports = [
    ./shared
    ./wayland
  ];
  home.packages = with pkgs; [
    inputs'.hypr-contrib.packages.grimblast

    hyprpicker
    libnotify
  ];
}
