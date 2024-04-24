{pkgs, ...}: {
  # begone the times I locked out my system when running sketchy stuff and had to reboot
  # i really didn't knew about this, thx raf
  services.earlyoom = {
    enable = true;
    enableNotifications = true;
    freeMemThreshold = 2;
    freeSwapThreshold = 2;
    extraArgs = [
      "-g" # kill all processes within a process group
      "--avoid '^(Hyprland|chromium-browser)$'" # it would be funny if it did so
      "--prefer '^(electron|.*.exe)$'" # that guy really hates electron huh, but I kinda do too
    ];

    # it should write the logs to the journal
    # but i am stupid so it may not work?
    killHook = pkgs.writeShellScript "earlyoom-kill-hook" ''
      echo "Process $EARLYOOM_NAME ($EARLYOOM_PID) was killed" | ${pkgs.systemd}/bin/systemd-cat -t "EarlyOOM" -p 3
    '';
  };
}
