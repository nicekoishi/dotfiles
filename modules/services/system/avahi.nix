{
  # this stuff makes my printer work, yay!
  # also hate u hp
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
