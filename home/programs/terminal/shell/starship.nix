{config, ...}: {
  home.sessionVariables.STARSHIP_CACHE = "${config.xdg.cacheHome}/starship";

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      scan_timeout = 2;
      command_timeout = 2000;
      line_break.disabled = false;

      character = {
        success_symbol = "[](bold green)";
        error_symbol = "[](bold red)";
      };

      git_commit.commit_hash_length = 7;
      git_branch.style = "bold purple";
      git_status = {
        ahead = "⇡ ";
        behind = "⇣ ";
        conflicted = " ";
        deleted = "✗ ";
        diverged = "⇆ ";
        modified = "✶ ";
        renamed = "»";
        staged = "✓ ";
        stashed = "≡ ";
        style = "red";
        untracked = "?";
      };

      nix_shell = {
        symbol = "   ";
        heuristic = true;
      };
    };
  };
}
