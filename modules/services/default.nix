{
  services = {
    dbus.implementation = "broker";

    # profile sync daemon
    psd = {
      enable = true;
      resyncTimer = "30m";
    };
  };
}
