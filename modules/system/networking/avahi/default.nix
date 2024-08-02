{
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;

    publish = {
      enable = true;
      domain = true;
      userServices = true;
    };
  };
}
