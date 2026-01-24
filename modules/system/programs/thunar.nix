{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (config.nice.host.opts) roles;
in {
  programs.thunar = mkIf (builtins.elem "desktop" roles) {
    enable = true;

    plugins = with pkgs.xfce; [
      thunar-archive-plugin
      thunar-media-tags-plugin
    ];
  };
}
