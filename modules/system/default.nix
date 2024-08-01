{
  imports = [
    ./login
    ./utilities
  ];

  services = {
    dbus.implementation = "broker";

    geoclue2.enable = true;
  };

  systemd = let
    timeout = ''
      DefaultTimeoutStartSec=10s
      DefaultTimeoutStopSec=10s
    '';
  in {
    extraConfig = timeout;
    user.extraConfig = timeout;
  };

  location.provider = "geoclue2";
}
