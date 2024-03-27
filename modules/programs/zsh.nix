{
  # shell completions
  environment.pathsToLink = [
    "/share/zsh"
    "/share/bash-completion"
    "/share/nix-direnv"
  ];

  programs = {
    less.enable = true;
    zsh.enable = true;
  };
}
