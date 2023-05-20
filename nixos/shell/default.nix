{config, ...}: let
  data = config.xdg.dataHome;
  dots = config.xdg.configHome;
  cache = config.xdg.cacheHome;
in {
  imports = [
    ./cli.nix
    ./starship.nix
    ./zsh.nix
  ];

  # i like my home clean
  home.sessionVariables = {
    LESSHISTFILE = cache + "/less/history";
    LESSKEY = dots + "/less/key";
    WINEPREFIX = data + "/wine";
    XAUTHORITY = "$XDG_RUNTIME_DIR/Xauthority";
    DELTA_PAGER = "less -R";
  };
}
