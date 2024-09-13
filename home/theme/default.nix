{osConfig, ...}: let
  inherit (cfg.cursor) name package size;

  cfg = osConfig.nice.user.style;
in {
  imports = [
    ./gtk
    ./qt
  ];

  home.pointerCursor = {
    inherit name package size;

    gtk.enable = true;
    x11.enable = true;
  };
}
