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

  tuigreet = {
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
  # TODO: multiple configurations for other greeters
  services.greetd.settings = {
    default_session = tuigreet;
  };
}
