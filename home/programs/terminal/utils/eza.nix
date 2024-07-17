{
  programs.eza = {
    enable = true;
    icons = true;
    git = true;
    enableZshIntegration = true;
    extraOptions = [
      "--group-directories-first"
      "--time-style=long-iso"
    ];
  };
}
