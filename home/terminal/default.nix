{config, ...}: let
  data = config.xdg.dataHome;
  dots = config.xdg.configHome;
  cache = config.xdg.cacheHome;
in {
  imports = [
    ./programs
    ./shell/zsh.nix
  ];

  # i like my home clean
  home.sessionVariables = {
    _JAVA_OPTIONS = "-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java";

    DIRENV_LOG_FORMAT = ""; # shut the f up

    DELTA_PAGER = "less -R";
    LESSHISTFILE = cache + "/less/history";
    LESSKEY = dots + "/less/key";

    WINEPREFIX = data + "/wine";
    XAUTHORITY = "$XDG_RUNTIME_DIR/Xauthority";
  };
}