{
  pkgs,
  inputs,
  ...
}: let
  inherit (inputs) hypr-contrib;
in {
  home.packages = with pkgs; [
    hypr-contrib.packages.${pkgs.system}.grimblast

    hyprpicker
    swaynotificationcenter
    wl-clipboard
    libnotify
  ];
}
