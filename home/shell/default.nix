{
  config,
  pkgs,
  ...
}: let
  data = config.xdg.dataHome;
  dots = config.xdg.configHome;
  cache = config.xdg.cacheHome;
in {
  imports = [
    ./cli.nix
    ./dev.nix
    ./fetch.nix
    ./nix.nix
    ./starship.nix
    ./zsh.nix
  ];

  # i like my home clean
  home.sessionVariables = {
    _JAVA_OPTIONS = "-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java";
    CHROME_EXECUTABLE = "${pkgs.brave}/opt/brave.com/brave/brave";
    DELTA_PAGER = "less -R";
    DOTS = config.home.homeDirectory + "/Documents/dots";
    LESSHISTFILE = cache + "/less/history";
    LESSKEY = dots + "/less/key";
    WINEPREFIX = data + "/wine";
    XAUTHORITY = "$XDG_RUNTIME_DIR/Xauthority";
    RUSTUP_HOME = data + "/rustup";
  };

  home.packages = with pkgs; [
    coreutils
    fd
    gnutar
    jaq
    unrar
    unzip
    zip
  ];
}
