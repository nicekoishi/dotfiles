{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.strings) concatStringsSep;

  sessionData = config.services.displayManager.sessionData.desktops;
  sessionPaths = concatStringsSep ":" [
    "${sessionData}/share/xsessions"
    "${sessionData}/share/wayland-sessions"
  ];

  # TODO: wouldn't an attrset be funny here?
  theme = concatStringsSep ";" [
    "border=lightmagenta"
    "text=cyan"
    "prompt=yellow"
    "time=yellow"
    "action=lightblue"
    "button=yellow"
    "container=darkgray"
    "input=lightgreen"
  ];

  defaultSession = {
    user = "greeter";
    command = concatStringsSep " " [
      (lib.getExe pkgs.greetd.tuigreet)
      "--time"
      "--remember"
      "--remember-user-session"
      "--asterisks"
      "--sessions '${sessionPaths}'"
      "--theme '${theme}'"
    ];
  };
in {
  services.greetd = {
    enable = true;
    settings = {
      terminal.vt = 2;
      default_session = defaultSession;
    };
  };

  # https://github.com/apognu/tuigreet/issues/68#issuecomment-1586359960
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInputs = "tty";
    StandardOutput = "tty";
    StandardError = "journal";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}
