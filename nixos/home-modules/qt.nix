{ pkgs, ... }:

{
  home.packages = with pkgs; [
    libsForQt5.qtstyleplugin-kvantum
    (catppuccin-kvantum.override {
      accent = "Teal";
      variant = "Macchiato";
    })
  ];

  home.sessionVariables = {
    QT_STYLE_OVERRIDE = "kvantum";
  };

  xdg.configFile."Kvantum/kvantum.kvconfig".source = ( pkgs.formats.ini {} ).generate "kvantum.kvconfig" {
    General.Theme = "Catppuccin-Macchiato-Teal";
  };
}
