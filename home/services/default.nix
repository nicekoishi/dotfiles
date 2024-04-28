{
  pkgs,
  inputs,
  ...
}: let
  inherit (inputs) hypr-contrib;
in {
  imports = [
    ./shared
    ./wayland
  ];
  home.packages = with pkgs; [
    hypr-contrib.packages.${pkgs.system}.grimblast

    hyprpicker
    libnotify
  ];
}
