{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (config.nice.host.opts) roles;
in {
  config = mkIf (builtins.elem "desktop" roles) {
    programs.adb.enable = true;

    services.udev = {
      # above already does it, but let's be explicit about it
      packages = [
        pkgs.android-udev-rules
      ];

      # Did you know a famous tool for Samsung devices has a version for linux:?
      extraRules = ''
        SUBSYSTEM=="usb", ATTR{idVendor}=="04e8", MODE="0666", GROUP="adbusers"
      '';
    };
  };
}
