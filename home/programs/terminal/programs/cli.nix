{pkgs, ...}: {
  home.packages = with pkgs; [
    # utils
    duf
    fd
    jaq
    ripgrep

    # archive
    gnutar
    unrar
    unzip
    zip
  ];

  programs.eza.enable = true;
}
