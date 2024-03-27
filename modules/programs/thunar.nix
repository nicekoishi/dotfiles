{pkgs, ...}: {
  # proper thumbnails
  services.tumbler.enable = true;
  environment.systemPackages = with pkgs; [
    ffmpegthumbnailer
    webp-pixbuf-loader
  ];

  programs = {
    xfconf.enable = true;

    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
  };
}
