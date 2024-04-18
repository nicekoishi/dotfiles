{pkgs, ...}: {
  # proper thumbnails
  services.tumbler.enable = true;

  environment.systemPackages = with pkgs; [
    ffmpegthumbnailer
    xfce.tumbler
    webp-pixbuf-loader
    ark
  ];

  programs = {
    xfconf.enable = true;

    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-media-tags-plugin
        thunar-volman
      ];
    };
  };
}
