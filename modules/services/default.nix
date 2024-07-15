{
  imports = [
    ./system
  ];

  services = {
    dbus.implementation = "broker";

    # profile sync daemon
    psd = {
      enable = true;
      resyncTimer = "30m";
    };

    geoclue2.enable = true;
  };

  location.provider = "geoclue2";
}
