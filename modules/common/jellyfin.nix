{pkgs, ...}: {
  services.jellyfin = {
    enable = true;
    openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    jellyfin-web
    jellyfin-ffmpeg
  ];
}
