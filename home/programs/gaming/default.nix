{
  pkgs,
  inputs,
  lib,
  ...
}: let
  arrpc = inputs.arrpc.packages.${pkgs.system}.arrpc;
in {
  imports = [
    ./minecraft
    ./legendary
  ];

  home.packages = with pkgs; [
    lutris
    mangohud

    arrpc
    inputs.nix-gaming.packages.${pkgs.system}.wine-ge
  ];

  systemd.user.services = {
    arRPC = {
      Unit.PartOf = ["graphical-session.target"];
      Unit.After = ["graphical-session.target"];
      Unit.Description = "Discord Rich Presence for browsers, and some custom clients";
      Install.WantedBy = ["graphical-session.target"];
      Service = {
        ExecStart = "${lib.getExe arrpc}";
        Restart = "always";
      };
    };
  };

  xdg.configFile."MangoHud/MangoHud.conf".text = ''
    toggle_hud=Scroll_Lock
    toggle_hud_position=Shift_R+Home
    toggle_logging=F11
    toggle_fps_limit=Shift_R+F10
  '';
}
