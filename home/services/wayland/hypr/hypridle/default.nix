{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.meta) getExe;
  hyprctl = "${config.wayland.windowManager.hyprland.package}/bin/hyprctl";
in {
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        after_sleep_cmd = "${hyprctl} dispatch dpms on";
        before_sleep_cmd = "${pkgs.systemd}/bin/loginctl lock-session";
        lock_cmd = "${pkgs.procps}/bin/pidof hyprlock || ${getExe config.programs.hyprlock.package}";
      };

      listener = [
        {
          timeout = 300;
          on-timeout = "${hyprctl} dispatch dpms off";
          on-resume = "${hyprctl} dispatch dpms on";
        }
        {
          timeout = 1800;
          on-timeout = "${pkgs.systemd}/bin/systemctl suspend";
        }
      ];
    };
  };
}
