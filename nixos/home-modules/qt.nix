{pkgs, ...}: {
  home.packages = with pkgs; [
    libsForQt5.qt5ct
  ];

  home.sessionVariables = {
    QT_PLATFORM_PLUGIN = "qt5ct";
  };
}
