{
  pkgs,
  lib,
  ...
}: {
  services.dbus.enable = true;
  services.gvfs.enable = true;
  security.polkit.enable = true;

  environment.systemPackages = with pkgs; [qt5.qtwayland];
  environment.sessionVariables = {
    _JAVA_OPTIONS = "-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java";
    CHROME_EXECUTABLE = "${pkgs.brave}/opt/brave.com/brave/brave";
    DELTA_PAGER = "less -R";
    LESSHISTFILE = "$XDG_CACHE_HOME/less/history";
    LESSKEY = "$XDG_CONFIG_HOME/less/key";
    LSP_USE_PLISTS = "true";
    WINEPREFIX = "$XDG_DATA_HOME/wine";
    XAUTHORITY = "$XDG_RUNTIME_DIR/Xauthority";
    RUSTUP_HOME = "$XDG_DATA_HOME/rustup";

    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";

    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_QPA_PLATFORMTHEME = "qt5ct";

    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";

    XCURSOR_SIZE = "16";

    NIXOS_OZONE_WL = "1";

    LIBSEAT_BACKEND = "logind";
    LIBVA_DRIVER_NAME = "nvidia";

    WLR_NO_HARDWARE_CURSORS = "1";
    YDOTOOL_SOCKET = "/tmp/.ydotool_socket";
  };

  xdg.portal = {
    enable = true;
  };

  services.greetd = {
    enable = true;
    settings = rec {
      initial_session = {
        command = "Hyprland";
        user = "nicekoishi";
      };
      default_session = initial_session;
    };
  };

  systemd = {
    services = {
      ydotool = {
        enable = true;
        description = "starts ydotool service";
        after = ["hyprland-session.target"];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${lib.getExe pkgs.ydotool}d";
          ExecReload = "${pkgs.util-linux}/bin/kill -hup $mainpid";
          Restart = "always";
          KillMode = "process";
          TimeoutSec = "180";
        };
      };
    };
    user.services = {
      ydotool.enable = false;
      polkit-gnome-authentication-agent-1 = {
        enable = true;
        description = "Starts polkit-gnome-authentication-agent-1";
        wantedBy = ["hyprland-session.target"];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
      # ...
    };
  };
}
