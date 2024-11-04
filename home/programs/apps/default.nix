{pkgs, ...}: {
  imports = [
    #./browsers/brave
    ./browsers/chromium
    ./browsers/firefox

    ./discord
    ./media
    ./office
  ];

  home.packages = with pkgs; [
    qbittorrent

    kdePackages.ark

    # backup file manager and its 'plugins'
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    kdePackages.kio
    kdePackages.kio-extras
    kdePackages.kimageformats
    kdePackages.kdegraphics-thumbnailers
    kdePackages.ffmpegthumbs
  ];
}
