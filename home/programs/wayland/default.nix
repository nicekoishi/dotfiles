{
  pkgs,
  inputs,
  ...
}: let
  inherit (inputs) hypr-contrib;
in {
  imports = [
    ./clipboard
    ./hyprland
    ./wlogout
  ];
  home.packages = with pkgs; [
    hypr-contrib.packages.${pkgs.system}.grimblast

    hyprpicker
    libnotify
  ];
}
