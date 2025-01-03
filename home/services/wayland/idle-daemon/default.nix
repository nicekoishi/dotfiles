{
  osConfig,
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (builtins) elem;
  inherit (lib.meta) getExe getExe';
  inherit (lib.strings) optionalString;

  hyprctl = "${getExe' config.wayland.windowManager.hyprland.package "hyprctl"}";
  systemd = exe: "${getExe' pkgs.systemd exe}";
in {
  services.hypridle = {
    enable = true;

    settings = {
      general = {
        after_sleep_cmd = "${hyprctl} dispatch dpms on";
        before_sleep_cmd = "${systemd "loginctl"} lock-session";
        lock_cmd = "${getExe' pkgs.procps "pidof"} hyprlock || ${getExe config.programs.hyprlock.package}";
      };

      listener = [
        {
          timeout = 300;
          on-timeout = "${hyprctl} dispatch dpms off";
          on-resume = "${hyprctl} dispatch dpms on";
        }
        {
          timeout = 1800;
          on-timeout = optionalString (!elem "server" osConfig.nice.host.opts.profiles) "${systemd "systemctl"} suspend";
        }
      ];
    };
  };
}
