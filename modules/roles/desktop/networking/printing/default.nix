{pkgs, ...}: {
  services = {
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };

    printing = {
      enable = true;
      drivers = with pkgs; [
        hplip
      ];
    };
  };

  hardware.sane = {
    enable = true;
    extraBackends = with pkgs; [
      hplip
    ];
  };
}
