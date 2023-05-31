{pkgs, ...}: {
  imports = [
    ./flake-pkgs.nix
  ];

  environment.systemPackages = with pkgs; [
    # etc
    lutris
    polkit_gnome

    # utils
    busybox
    cifs-utils
    cliphist
    egl-wayland
    ffmpegthumbnailer
    git
    libva-utils
    wget
    wl-clipboard

    # media
    ffmpeg
    mpv

    # virt manager and friends
    spice
    spice-gtk
    spice-protocol
    virt-manager
    virt-viewer

    # the best wallpaper daemon and its friends
    eww-wayland
    gnome.adwaita-icon-theme
    papirus-icon-theme
    swww

    # discord moderators be like
    webcord-vencord

    # wine
    winetricks
    wineWowPackages.waylandFull
  ];
}
