{
  config,
  inputs,
  lib,
  #pkgs,
  ...
}: let
  command = "hyprctl dispatch dpms off";
  sendhelp =
    builtins.replaceStrings
    ["Hyprland"] ["${command}"] "${lib.getExe config.wayland.windowManager.hyprland.package}";
  #aaa = pkgs.writeShellScriptBin "sendhelp" ''
  #  echo "${sendhelp}"
  #'';
in {
  imports = [
    inputs.hypridle.homeManagerModules.default
  ];

  # home.packages = [aaa];

  # TODO: dpms only for now, hyprlock later
  services.hypridle = {
    enable = true;

    listeners = [
      {
        timeout = 300;
        onTimeout = "${sendhelp}";
      }
    ];
  };
}
