{
  networking = {
    nameservers = ["2606:4700:4700::1111 2606:4700:4700::1001"];
    stevenblack = {
      enable = true;
      block = ["gambling" "porn"];
    };
  };

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
  };
}
