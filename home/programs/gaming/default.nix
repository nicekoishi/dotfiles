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

    arRPC
    nix-gaming.packages.${pkgs.system}.wine-ge
  ];

  programs.mangohud = {
    enable = true;
    settings = {
      background_alpha = "0.5";
      cpu_stats = true;
      cpu_temp = true;
      enableSessionWide = true;
      font_size = 24;
      fps = true;
      frame_timing = true;
      frametime = true;
      gpu_stats = true;
      gpu_temp = true;
      vulkan_driver = false;
      wine = true;
      toggle_hud = "Shift_R+F12";
    };
  };

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
