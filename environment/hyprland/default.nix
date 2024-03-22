{
  inputs,
  pkgs,
  ...
}: {
  services = {
    dbus.enable = true;
    gvfs.enable = true;
    greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command = "Hyprland";
          user = "supeen";
        };
        default_session = initial_session;
      };
    };
  };
  security.polkit.enable = true;

  programs.hyprland.portalPackage = inputs.xdg-desktop-portal-hyprland.packages."${pkgs.system}".xdg-desktop-portal-hyprland;

  environment = {
    sessionVariables = {
      ADB_LIBUSB = "1";
      WLR_NO_HARDWARE_CURSORS = "1";
      XDG_SESSION_TYPE = "wayland";
      GBM_BACKEND = "nvidia-drm";

      _JAVA_OPTIONS = "-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java";
      DELTA_PAGER = "less -R";
      LESSHISTFILE = "$XDG_CACHE_HOME/less/history";
      LESSKEY = "$XDG_CONFIG_HOME/less/key";
      LSP_USE_PLISTS = "true";
      WINEPREFIX = "$XDG_DATA_HOME/wine";
      XAUTHORITY = "$XDG_RUNTIME_DIR/Xauthority";
      RUSTUP_HOME = "$XDG_DATA_HOME/rustup";

      QT_QPA_PLATFORM = "wayland";
      QT_QPA_PLATFORMTHEME = "qt5ct";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";

      XCURSOR_SIZE = "16";

      NIXOS_OZONE_WL = "1";

      LIBSEAT_BACKEND = "logind";

      YDOTOOL_SOCKET = "/tmp/.ydotool_socket";
    };

    systemPackages = [pkgs.qt6.qtwayland];
  };

  systemd = {
    user.services = {
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
