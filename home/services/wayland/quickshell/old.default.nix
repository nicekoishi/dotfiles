{
  config,
  osConfig,
  inputs,
  lib,
  pkgs,
  ...
}: let
  inherit (inputs) quickshell;
  inherit (lib) mkIf mkEnableOption mkOption types;

  dependencies = with pkgs; [
    bash
  ];

  cfg = config.services.quickshell;
in {
  options.services.quickshell = {
    enable = mkEnableOption "simple quickshell module";
    package = mkOption {
      type = types.package;
      default =
        if builtins.elem "nvidia" osConfig.services.xserver.videoDrivers
        then quickshell.packages."${pkgs.system}".nvidia
        else quickshell.packages.default;
    };
  };

  config = {
    systemd.user.services.quickshell = {
      Unit = {
        Description = "Simple and flexbile QtQuick based desktop shell toolkit.";
        #PartOf = [
        #  "tray.target"
        #  "graphical-session.target"
        #];
      };

      Service = {
        Environment = "PATH=/run/wrappers/bin:${lib.makeBinPath dependencies}";
        ExecStart = "${cfg.package}/bin/quickshell";

        Restart = "on-failure";
        KillMode = "mixed";
      };

      #Install.WantedBy = ["graphical-session.target"];
    };
  };
}
