{pkgs, ...}: {
  # requires manual setup through its web ui
  # or maybe do cli if you want udnno
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
