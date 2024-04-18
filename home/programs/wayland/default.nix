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
    ./ocr
  ];
  home.packages = with pkgs; [
    hypr-contrib.packages.${pkgs.system}.grimblast

    hyprpicker
    libnotify
  ];
}
