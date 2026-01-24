{
  lib,
  pkgs,
  ...
}: let
  inherit (lib.strings) concatStringsSep;
in {
  # begone the times I locked out my system when running sketchy stuff and had to reboot
  # i really didn't knew about this, thx raf
  services.earlyoom = {
    enable = true;
    enableNotifications = true;
    freeMemThreshold = 2;
    freeSwapThreshold = 2;
    extraArgs = let
      avoid = concatStringsSep "|" [
        "Hyprland"
        "Xwayland"
        "dbus-.*"
        "gpg-agent"
        "ssh-agent"
        "systemd"
        "systemd-.*"
      ];
      prefer = concatStringsSep "|" [
        ".*.exe"
        "Isolated Web Co"
        "Web Content"
        "chromium.*"
        "electron" # imagine screensharing making the pc laggy for some reason
        "java."
      ];
    in [
      "-g" # kill all processes within a process group

      "--avoid"
      "^(${avoid})$" # it would be funny if it did so

      "--prefer"
      "^(${prefer})$" # that guy really hates electron huh, but I kinda do too
    ];

    killHook = pkgs.writeShellScript "earlyoom-kill-hook" ''
      echo "Process $EARLYOOM_NAME ($EARLYOOM_PID) was killed" | ${pkgs.systemd}/bin/systemd-cat -t "EarlyOOM" -p 3
    '';
  };
}
