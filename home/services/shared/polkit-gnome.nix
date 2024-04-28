{pkgs, ...}: {
  systemd.user.services = {
    polkit-gnome-authentication-agent-1 = {
      Install.WantedBy = ["hyprland-session.target"];

      Unit = {
        PartOf = ["graphical-session.target"];
        After = ["graphical-session.target"];
      };

      Service.ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
    };
  };
}
