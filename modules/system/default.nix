{
  imports = [
    ./login
    ./utilities
  ];

  services = {
    dbus.implementation = "broker";

    geoclue2.enable = true;
  };

  location.provider = "geoclue2";
}
