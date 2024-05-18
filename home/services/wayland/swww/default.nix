# TODO: couldn't this be made into an option?
{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf;
in {
  systemd.user = mkIf config.wayland.windowManager.hyprland.enable {
    services = {
      wallpaperd = {
        Install.WantedBy = ["hyprland-session.target"];

        Unit = {
          PartOf = ["graphical-session.target"];
          After = ["graphical-session.target"];
        };

        Service = {
          ExecStart = "${pkgs.swww}/bin/swww-daemon";
          Restart = "always";
        };
      };
    };
  };
}
