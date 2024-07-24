let
  XDG_CACHE_HOME = "$HOME/.local/cache";
  XDG_DATA_HOME = "$HOME/.local/share";
  XDG_STATE_HOME = "$HOME/.local/state";
  XDG_CONFIG_HOME = "$HOME/.config";
  XDG_RUNTIME_DIR = "/run/user/$UID";
in {
  environment = {
    variables = {
      inherit XDG_CACHE_HOME XDG_DATA_HOME XDG_CONFIG_HOME XDG_RUNTIME_DIR XDG_STATE_HOME;
    };

    sessionVariables = {
      # general
      BROWSER = "firefox";
      EDITOR = "nvim";
      MANPAGER = "nvim +Man!";
      SUDO_EDITOR = "nvim";
      VISUAL = "nvim";
      LSP_USE_PLISTS = "true";
      DELTA_PAGER = "less -R";
      PAGER = "less -FR";
      CUDA_CACHE_PATH = "${XDG_CACHE_HOME}/nv";
      LESSHISTFILE = "${XDG_CACHE_HOME}/less/history";
      SQLITE_HISTORY = "${XDG_CACHE_HOME}/sqlite_history";
      LESSKEY = "${XDG_CONFIG_HOME}/less/key";
      WINEPREFIX = "${XDG_DATA_HOME}/wine";
      GNUPGHOME = "${XDG_DATA_HOME}/gnupg";
      KDEHOME = "${XDG_CONFIG_HOME}/kde";
      XAUTHORITY = "${XDG_RUNTIME_DIR}/Xauthority";

      # programming stuff
      ADB_LIBUSB = "1";
      ANDROID_HOME = "${XDG_DATA_HOME}/android";
      CARGO_HOME = "${XDG_DATA_HOME}/cargo";
      DOCKER_CONFIG = "${XDG_CONFIG_HOME}/docker";
      NODE_REPL_HISTORY = "${XDG_DATA_HOME}/node_repl_history";
      NPM_CONFIG_CACE = "${XDG_CACHE_HOME}/npm";
      NPM_CONFIG_TMP = "${XDG_RUNTIME_DIR}/npm";
      NPM_CONFIG_USERCONFIG = "${XDG_CONFIG_HOME}/npm/config";

      _JAVA_OPTIONS = "-Djava.util.prefs.userRoot=${XDG_CONFIG_HOME}/java";
    };
  };

  programs.npm = {
    npmrc = ''
      prefix=''${XDG_DATA_HOME}/npm
      cache=''${XDG_CACHE_HOME}/npm
      init-module=''${XDG_CONFIG_HOME}/npm/config/npm-init.js
    '';
  };
}
