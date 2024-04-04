{config, ...}: {
  home.sessionVariables.STARSHIP_CACHE = "${config.xdg.cacheHome}/starship";

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      scan_timeout = 2;
      command_timeout = 2000;

      character = {
        success_symbol = "";
        error_symbol = "";
      };

      git_status = {
        deleted = "✗";
        modified = "✶";
        staged = "✓";
        stashed = "≡";
      };
    };
  };
}
