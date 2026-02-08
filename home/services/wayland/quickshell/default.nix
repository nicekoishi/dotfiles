{
  osConfig,
  inputs',
  lib,
  ...
}: let
  inherit (osConfig.nice.user) desktop;
  inherit (lib.modules) mkIf;
in {
  config = mkIf desktop.hyprland.enable {
    systemd.user.services.quickshell = {
      Unit = {
        Description = "Quickshell";
        Documentation = "https://quickshell.outfoxxed.me/docs/";
        After = ["hyprland-session.target"];
      };

      Service = {
        ExecStart = "${lib.getExe inputs'.quickshell.packages.default} --path ${./qml}";
        Restart = "on-failure";
      };

      Install.WantedBy = ["hyprland-session.target"];
    };
  };
}
