# TODO: couldn't this be made into an option?
{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkIf makeBinPath;

  # cursed iteration no. 5
  deps = makeBinPath (with pkgs; [swww]);

  script = pkgs.writeShellScript "randrand" ''
    export PATH=$PATH:${deps}
    swww img "$(shuf -n 1 -e ${config.xdg.userDirs.extraConfig.XDG_WALLPAPERS_DIR}/*)"
  '';

  configuration = [
    "SWWW_TRANSITION=any"
    "SWWW_TRANSITION_DURATION=2"
    "SWWW_TRANSITION_FPS=60"
    "SWWW_TRANSITION_BEZIER=0.05,0.9,0.1,1.05"
  ];
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

      wallpaperd-change = {
        Install.WantedBy = ["hyprland-session.target"];

        Unit = {
          After = ["wallpaperd.service"];
          PartOf = ["wallpaperd.service"];
          Wants = ["wallpaperd-change.timer"];
        };

        Service = {
          Environment = configuration;
          Type = "oneshot";
          ExecStart = script.outPath;
        };
      };
    };

    timers.wallpaperd-change = {
      Unit.PartOf = ["wallpaperd-change.service" "wallpaperd.service"];

      Timer.OnUnitActiveSec = "10min";
    };
  };
}
