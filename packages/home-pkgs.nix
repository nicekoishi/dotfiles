{pkgs, inputs, ...}: {
  home.packages = with pkgs; [
    alejandra

    # me/myself/i/cringe
    inputs.nix-utils.packages.${system}.fastfetch

    brave
    coreutils
    fd
    gimp
    gnutar
    grim
    heroic
    hyprpicker
    jaq
    kitty
    krita
    libreoffice-fresh
    libsForQt5.kdenlive
    libsForQt5.skanpage
    lxqt.lxqt-archiver
    mpv
    neofetch
    nil
    nvtop
    obs-studio
    playerctl
    prismlauncher-qt5
    python3Full
    ripgrep
    slurp
    starship
    swaynotificationcenter
    unrar
    unzip
    viewnior
    webcord-vencord
    zip
  ];
}
