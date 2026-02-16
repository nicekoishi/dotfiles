{pkgs, ...}: {
  programs.thunar = {
    enable = true;

    plugins = with pkgs; [
      thunar-archive-plugin
      thunar-media-tags-plugin
    ];
  };

  services.tumbler.enable = true;

  environment.systemPackages = with pkgs; [
    ffmpegthumbnailer
    gnome-epub-thumbnailer
    libgsf
    poppler_gi
    webp-pixbuf-loader
  ];
}
