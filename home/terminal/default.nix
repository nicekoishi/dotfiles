{
  imports = [
    ./programs
    ./shell/zsh.nix
    ./shell/transient-services.nix
  ];

  # shut the f up
  home.sessionVariables.DIRENV_LOG_FORMAT = "";
}
