{pkgs, ...}: {
  programs.dconf.enable = true;
  services = {
    dbus.packages = with pkgs; [
      gcr
      gnome.gnome-settings-daemon
    ];
    gvfs.enable = true;
  };
}
