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
    libva-utils
    lutris
    mpv
    papirus-icon-theme
    polkit_gnome
    spice spice-gtk
    spice-protocol
    swww
    virt-manager
    virt-viewer
    webcord-vencord
    wget
    wineWowPackages.waylandFull
    winetricks
    wl-clipboard
  ];
}
