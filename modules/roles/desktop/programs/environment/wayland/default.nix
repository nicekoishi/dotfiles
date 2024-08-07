{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;
  cfg = config.nice.host;
in {
  config = mkIf cfg.waylandReady {
    environment.variables = {
      NIXOS_OZONE_WL = "1";
      _JAVA_AWT_WM_NONEREPARENTING = "1";
      JDK_JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=on -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel";

      #GDK_BACKEND = "wayland";
      XDG_SESSION_TYPE = "wayland";
    };

    programs.xwayland.enable = true;
  };
}
