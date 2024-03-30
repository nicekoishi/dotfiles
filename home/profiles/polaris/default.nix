{
  imports = [
    # self/home
    ../../git.nix
    ../../gnupg.nix
    ../../noise.nix
    ../../xdg.nix

    # importing both emacs and neovim for now
    ../../editors

    # hell
    ../../programs
    ../../programs/apps/obs
    ../../programs/wayland/quickshell
    ../../programs/wayland/anyrun
    ../../programs/wayland/swaync
    ../../programs/wayland/swww

    ../../shell
    ../../theme
  ];
}
