{
  config,
  lib,
  ...
}: let
  hyprland = lib.getExe config.programs.hyprland.package;
in {
  services.greetd = let
    session = {
      command = "${hyprland}";
      user = "supeen";
    };
  in {
    enable = true;
    settings = {
      terminal.vt = 1;
      default_session = session;
      initial_session = session;
    };
  };
}
