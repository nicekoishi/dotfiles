{pkgs, ...}: {
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      hplip
    ];
  };

  hardware.sane = {
    enable = true;
    extraBackends = with pkgs; [
      hplip
    ];
  };
}
