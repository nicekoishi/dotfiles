{
  pkgs,
  inputs,
  lib,
  ...
}: let
  inherit (inputs) arrpc nix-gaming;
  arRPC = arrpc.packages.${pkgs.system}.arrpc;
in {
  imports = [
    ./minecraft
    ./legendary
  ];

  home.packages = with pkgs; [
    lutris
    mangohud

    arRPC
    nix-gaming.packages.${pkgs.system}.wine-ge
  ];

  systemd.user.services = {
    arRPC = {
      Unit = {
        PartOf = ["graphical-session.target"];
        After = ["graphical-session.target"];
        Description = "Discord Rich Presence for browsers, and some custom clients";
      };
      Install.WantedBy = ["graphical-session.target"];
      Service = {
        ExecStart = "${lib.getExe arRPC}";
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
