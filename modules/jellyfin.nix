{pkgs, ...}: {
  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    jellyfin-web
    # FIXME: is this really needed? maybe further testing will tell
    jellyfin-ffmpeg
  ];
}
