{pkgs, ...}: {
  systemd.user.services = {
    polkit-gnome-authentication-agent-1 = {
      enable = true;
      description = "Starts polkit-gnome-authentication-agent-1";
      wantedBy = ["hyprland-session.target"];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
}
