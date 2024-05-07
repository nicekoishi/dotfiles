{
  config,
  inputs,
  pkgs,
  ...
}: {
  # TODO: dpms only for now, hyprlock later
  services.hypridle = {
    enable = true;
    package = inputs.hypridle.packages."${pkgs.system}".hypridle;

    settings = {
      listeners = [
        {
          timeout = 300;
          onTimeout = "${config.wayland.windowManager.hyprland.package}/bin/hyprctl dispatch dpms off";
        }
        {
          timeout = 1800;
          onTimeout = "${pkgs.systemd}/bin/systemctl suspend";
        }
      ];
    };
  };
}
