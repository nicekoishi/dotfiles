{pkgs, ...}: let
  catppuccin-obs = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "obs";
    rev = "9a78d89";
    hash = "sha256-8DjAjpYsC9lEHe6gt/B7YCyfqVPaA5Qg1hbIMyyx/ho=";
  };
in {
  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      # helps me setup auto replay buffer
      # FIXME: Build failure as from 23/09/2024
      # advanced-scene-switcher

      obs-gstreamer
      obs-pipewire-audio-capture
      obs-vkcapture
    ];
  };

  xdg.configFile."obs-studio/themes" = {
    source = "${catppuccin-obs}/themes";
    recursive = true;
  };
}
