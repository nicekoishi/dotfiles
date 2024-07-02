{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (lib.meta) getExe;

  quickshell = inputs.quickshell.packages."${pkgs.system}".quickshell;

  requiredDeps = with pkgs; [
    inputs.hyprland.packages."${pkgs.system}".default

    bash
  ];

  guiDeps = with pkgs; [
    mission-center
  ];

  dependencies = requiredDeps ++ guiDeps;
in {
  systemd.user.services.quickshell = mkIf (!config.programs.ags.enable) {
    Unit = {
      Description = "Simple and flexbile QtQuick based desktop shell toolkit.";
      PartOf = [
        "tray.target"
        "graphical-session.target"
      ];
    };

    Service = {
      Environment = "PATH=/run/wrappers/bin:${lib.makeBinPath dependencies}";
      ExecStart = "${getExe quickshell}";

      Restart = "on-failure";
      KillMode = "mixed";
    };

    Install.WantedBy = ["graphical-session.target"];
  };
}
