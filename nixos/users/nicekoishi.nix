{config,pkgs,...}:

{
  ## User
  users.users.nicekoishi = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "sys"
      "log"
      "floppy"
      "scanner"
      "power"
      "rfkill"
      "users"
      "video"
      "storage"
      "optical"
      "lp"
      "audio"
      "adm"
    ]; # Better be safe than sorry
  };

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableBashCompletion = true;
    autosuggestions.enable = true;
  };
}
