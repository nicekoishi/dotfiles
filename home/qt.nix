{pkgs, ...}: {
  home = {
    packages = [pkgs.libsForQt5.qt5ct];
    sessionVariables = {
      QT_QPA_PLATFORMTHEME = "qt5ct";
    };
  };

  xdg.configFile."qt5ct/qt5ct.conf".source = programs/qt5ct/qt5ct.conf;
  xdg.configFile."qt5ct/colors/Catppuccin-Macchiato.conf".source = programs/qt5ct/colors/Catppuccin-Macchiato.conf;
}
