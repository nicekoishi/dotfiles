{pkgs, ...}: {
  services.jellyfin = {
    enable = false;
    openFirewall = false;
  };

  environment.systemPackages = with pkgs; [
    jellyfin-web
    # FIXME: is this really needed? maybe further testing will tell
    jellyfin-ffmpeg
  ];
}
