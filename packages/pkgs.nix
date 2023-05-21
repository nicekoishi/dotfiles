{ pkgs, ... }:

{
  imports = [
    ./flake-pkgs.nix
  ];

  environment.systemPackages = with pkgs; [
    busybox
    cifs-utils
    clang
    cliphist
    cmake
    egl-wayland
    eww-wayland
    ffmpeg
    ffmpegthumbnailer
    git
    gnome.adwaita-icon-theme
    libcamera
    libgsf
    libsForQt5.qt5.qtwayland
    libva-utils
    lutris
    mesa
    mpv
    papirus-icon-theme
    polkit_gnome
    qt6.qtwayland
    spice spice-gtk
    spice-protocol
    swww
    virt-manager
    virt-viewer
    xfce.thunar
    xfce.thunar-media-tags-plugin
    xfce.thunar-archive-plugin
    webcord-vencord
    wget
    wineWowPackages.waylandFull
    winetricks
    wl-clipboard
  ];
}
