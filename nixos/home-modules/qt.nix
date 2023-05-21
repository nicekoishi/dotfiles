{ pkgs, ... }:

{
  home.packages = with pkgs; [
    libsForQt5.qt5ct
  ];

  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt5ct";
  };

}
