{
  inputs,
  lib,
  ...
}: let
  inherit (builtins) filter map toString;
  inherit (lib.filesystem) listFilesRecursive;
  inherit (lib.strings) hasSuffix;
in {
  imports =
    [inputs.hyprland.homeManagerModules.default]
    ++ filter (hasSuffix ".nix") (
      map toString (filter (p: p != ./default.nix) (listFilesRecursive ./config))
    );

  wayland.windowManager.hyprland = {
    enable = true;
    systemd = {
      enable = true;
      variables = ["--all"];
    };

    settings = {
      monitor = ["HDMI-A-1, 1920x1080, 0x0, 1"];
    };
  };
}
