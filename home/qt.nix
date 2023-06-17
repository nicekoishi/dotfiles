{pkgs, ...}: {
  home = {
    packages = [
      pkgs.qt5ct
    ];
    sessionVariables = {
      QT_QPA_PLATFORMTHEME = "qt5ct";
    };
  };

  xdg.configFile."qt5ct/qt5ct.conf".source = config/qt5ct/qt5ct.conf;
  xdg.configFile."qt5ct/colors/Catppuccin-Macchiato.conf".source = config/qt5ct/colors/Catppuccin-Macchiato.conf;
}
