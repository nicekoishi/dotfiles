{pkgs, ...}: {
  programs.firefox = {
    enable = true;
    # is this really needed? just in case
    package = pkgs.wrapFirefox (pkgs.firefox-unwrapped.override {
      pipewireSupport = true;
      ffmpegSupport = true;
    }) {};
    profiles.supeen = {};
  };

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    MOZ_DBUS_REMOTE = 1;
  };
}
