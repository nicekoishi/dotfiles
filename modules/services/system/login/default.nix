{
  config,
  lib,
  ...
}: {
  services.greetd = {
    enable = true;
    vt = 2; # greetd shittin text on systemd startup log
    settings = let
      session = {
        command = "${lib.getExe config.programs.hyprland.package} &> ~/.local/share/hyprland.log";
        user = "supeen";
      };
    in {
      default_session = session;
      initial_session = session;
    };
  };
}
