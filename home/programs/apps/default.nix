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
    kdePackages.dolphin
    kdePackages.dolphin-plugins
    kdePackages.kio
    kdePackages.kio-extras
    kdePackages.kimageformats
    kdePackages.kdegraphics-thumbnailers
    kdePackages.ffmpegthumbs
  ];
}
