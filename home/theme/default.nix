{pkgs, ...}: {
  imports = [
    ./apps

    ./gtk.nix
    ./qt.nix
  ];

  services.darkman = {
    enable = true;
    settings = {
      usegeoclue = true;
      dbusserver = true;
      portal = true;
    };
  };

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
}
