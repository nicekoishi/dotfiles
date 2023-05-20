{ config, lib, pkgs, inputs, ... }:

{
  services.dbus.enable = true;
  services.gvfs.enable = true;
  security.polkit.enable = true;

  imports = [
    ../../../packages/pkgs.nix
    ../../users/nicekoishi.nix
  ];

  programs.hyprland = {
    enable = true;
    nvidiaPatches = true;
  };

  environment.sessionVariables = rec {
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME="nvidia";

    QT_QPA_PLATFORM = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";

    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_CURRENT_DESKTOP = "Hyprland";

    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";

    XCURSOR_SIZE = "16";

    NIXOS_OZONE_WL = "1";

    LIBSEAT_BACKEND = "logind";
    LIBVA_DRIVER_NAME = "nvidia";

    WLR_NO_HARDWARE_CURSORS = "1";
  };

  services.greetd = {
    enable = true;
    package = pkgs.greetd.regreet;
    settings = rec {
      initial_session = {
        command = "Hyprland";
        user = "nicekoishi";
      };
    default_session = initial_session;
    };
  };

  services.emacs = {
    enable = true;
    package = pkgs.emacs;
  };

  environment.etc = {
    "hypr/swww-daemon".source = "${pkgs.swww}/bin/swww-daemon";
    "hypr/swww".source = "${pkgs.swww}/bin/swww";
    "hypr/xdg-is-a-dummy-hypr".source = "${pkgs.xdg-desktop-portal-hyprland}";
    "hypr/xdg-is-a-dummy".source = "${pkgs.xdg-desktop-portal}";
  };
  systemd = {
    user.services = {
      polkit-gnome-authentication-agent-1 = {
        enable = true;
        description = "Starts polkit-gnome-authentication-agent-1";
        wantedBy = [ "default.target" ];
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
