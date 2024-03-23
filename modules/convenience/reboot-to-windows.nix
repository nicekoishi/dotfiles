{pkgs, ...}: let
  windoes = pkgs.makeDesktopItem {
    desktopName = "Windoes";
    name = "reboot-to-windows";
    icon = "distributor-logo-windows";
    exec = "systemctl reboot --boot-loader-entry=auto-windows";
  };
in {
  # TODO: Delete this cursed creation and spread the holy wallpapers
  environment.systemPackages = [
    windoes
  ];
}
