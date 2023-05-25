{ pkgs, ... }:

{
  home.packages = with pkgs; [
    poppler
    xfce.xfconf
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin
  ];

}
