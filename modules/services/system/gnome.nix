{pkgs, ...}: {
  programs.dconf.enable = true;
  services = {
    dbus.packages = with pkgs; [gcr];
    gvfs.enable = true;
  };
}
