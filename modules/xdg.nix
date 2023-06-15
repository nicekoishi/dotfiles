{
  # home.sessionVariables does not work for some of these
  # so I did it all in here

  environment.sessionVariables = {
    XDG_CACHE_HOME = "$HOME/.local/cache";

    LESSHISTFILE = "$XDG_CACHE_HOME/less/history";
    LESSKEY = "$XDG_CONFIG_HOME/less/key";

    CARGO_HOME = "$XDG_DATA_HOME/cargo";
    RUSTUP_HOME = "$XDG_DATA_HOME/rustup";

    WINEPREFIX = "$XDG_DATA_HOME/wine";

    XAUTHORITY = "$XDG_RUNTIME_DIR/Xauthority";

    _JAVA_OPTIONS = "-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java";
  };

  # NPM, pls go inside config home
  programs.npm.npmrc = ''
    prefix=''${XDG_DATA_HOME}/npm
    cache=''${XDG_CACHE_HOME}/npm
    init-module=''${XDG_CONFIG_HOME}/npm/config/npm-init.js
  '';
}
