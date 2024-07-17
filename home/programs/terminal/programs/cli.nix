{pkgs, ...}: {
  home.packages = with pkgs; [
    # utils
    duf
    fd
    jaq

    # archive
    gnutar
    unrar
    unzip
    zip
  ];
}
