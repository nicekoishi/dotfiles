{pkgs, ...}: {
  imports = [
    #./browsers/brave
    ./browsers/chromium

    ./discord
    ./media
    ./office
  ];

  home.packages = with pkgs; [
    qbittorrent

    plasma5Packages.dolphin
    plasma5Packages.dolphin-plugins
    plasma5Packages.kio
    plasma5Packages.kio-extras
    #plasma5Packages.kio-gdrive # doesn't work if your account has two factor auth
    plasma5Packages.kimageformats
    plasma5Packages.kdegraphics-thumbnailers
    plasma5Packages.ffmpegthumbs
  ];
}
