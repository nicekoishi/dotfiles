{pkgs, ...}: {
  imports = [
    ./flake-pkgs.nix
  ];

  environment.systemPackages = with pkgs; [
    # etc
    polkit_gnome

    # utils
    cifs-utils
    cliphist
    egl-wayland
    ffmpegthumbnailer
    git
    libva-utils
    wget
    wl-clipboard
    ydotool

    # virt manager and friends
    spice
    spice-gtk
    spice-protocol
    virt-manager
    virt-viewer

    # the best wallpaper daemon and its friends
    gnome.adwaita-icon-theme
    papirus-icon-theme

    # wine
    winetricks
  ];
}
