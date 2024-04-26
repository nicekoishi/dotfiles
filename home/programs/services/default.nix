{
  pkgs,
  inputs,
  ...
}: let
  inherit (inputs) hypr-contrib;
in {
  imports = [
    ./wayland

    ./noise.nix
    ./polkit-gnome.nix
    ./xdg.nix
  ];
  home.packages = with pkgs; [
    hypr-contrib.packages.${pkgs.system}.grimblast

    hyprpicker
    libnotify
  ];
}
