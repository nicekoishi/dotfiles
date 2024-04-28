{pkgs, ...}: {
  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [
      mpris # mpris controls
      thumbfast # on-the-fly thumbnails
      thumbnail # seekbar thumbnails
    ];

    config = {
      border = "no";
      hwdec = "auto";
      keep-open = true;
      osc = "no";
      osc-bar = "no";
      profile = "gpu-hq";
    };
  };
}
