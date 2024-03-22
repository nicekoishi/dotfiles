{pkgs, ...}: {
  services.jellyfin = {
<<<<<<< HEAD
    enable = true;
    openFirewall = true;
=======
    enable = false;
    openFirewall = false;
>>>>>>> 12c72a1 (too lazy to separate them all)
  };

  environment.systemPackages = with pkgs; [
    jellyfin-web
    # FIXME: is this really needed? maybe further testing will tell
    jellyfin-ffmpeg
  ];
}
