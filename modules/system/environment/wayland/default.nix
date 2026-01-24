{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (cfg.host) opts;

  isDesktop = builtins.elem "desktop" opts.roles;

  cfg = config.nice;
in {
  config = mkIf (isDesktop && opts.isWayland) {
    environment.variables = {
      NIXOS_OZONE_WL = "1";
      _JAVA_AWT_WM_NONEREPARENTING = "1";
      JDK_JAVA_OPTIONS = "-Dawt.useSystemAAFontSettings=on -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel";

      #GDK_BACKEND = "wayland";
      XDG_SESSION_TYPE = "wayland";
      LIBSEAT_BACKEND = "logind";
    };

    programs = {
      uwsm.enable = true;
      xwayland.enable = true;
    };
  };
}
