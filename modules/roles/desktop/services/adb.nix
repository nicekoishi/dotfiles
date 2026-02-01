{pkgs, ...}: {
  config = {
    environment.systemPackages = [pkgs.android-tools];

    services.udev = {
      # Did you know a famous tool for Samsung devices has a version for linux:?
      extraRules = ''
        SUBSYSTEM=="usb", ATTR{idVendor}=="04e8", MODE="0666", GROUP="adbusers"
      '';
    };
  };
}
