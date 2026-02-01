{
  lib,
  pkgs,
  ...
}: {
  config = {
    programs = {
      dconf.enable = true;
      nm-applet.enable = true;
      seahorse.enable = true;
    };

    services = {
      dbus.packages = with pkgs; [
        dconf
        gcr
        udisks2
      ];

      udev.packages = with pkgs; [
        gnome-settings-daemon
      ];

      gvfs.enable = true;

      # stupid, thats why gnome calendar wasn't working properly
      gnome = {
        glib-networking.enable = true;
        evolution-data-server.enable = true;
        gnome-online-accounts.enable = true;
        gnome-keyring.enable = true;
        gnome-remote-desktop.enable = lib.mkForce false;
        gcr-ssh-agent.enable = lib.mkForce false;
      };
    };
  };
}
