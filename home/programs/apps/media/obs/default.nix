{pkgs, ...}: {
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-vaapi
      obs-gstreamer
      obs-pipewire-audio-capture
      obs-vkcapture
    ];
  };
}
