{
  services.xserver = {
    enable = true;

    desktopManager.gnome.enable = true;
  };

  #environment.gnome.excludePackages = with pkgs;
  #  [
  #  ]
  #  ++ (with pkgs.gnome; []);
}
