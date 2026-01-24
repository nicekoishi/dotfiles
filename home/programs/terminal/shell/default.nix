{config, ...}: {
  imports = [./starship.nix];

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    autocd = true;
    dirHashes = {
      code = "$HOME/Documents/code";
      dl = "$HOME/Downloads";
      docs = "$HOME/Documents";
      dots = "$HOME/Documents/code/dots";
      dev = "$HOME/Documents/dev";
      xvids = "$HOME/Videos";
    };
    dotDir = "${config.xdg.configHome}/zsh";
    history = {
      expireDuplicatesFirst = true;
      path = "${config.xdg.dataHome}/zsh_history";
    };

    initContent = ''
      # C-right / C-left for word skips
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word

      # C-Backspace / C-Delete for word deletions
      bindkey "^[[3;5~" kill-word
      bindkey "^H" backward-kill-word

      # case insensitive tab completion
      zstyle ':completion:*' completer _complete _ignored _approximate
      zstyle ':completion:*' list-colors '\'
      zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
      zstyle ':completion:*' menu select
      zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
      zstyle ':completion:*' verbose true

      # use cache for completions
      zstyle ':completion:*' use-cache on
      zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
      _comp_options+=(globdots)

      # shouldn't it ask by default?
      # also, don't use nh globally as it breaks cases where --ask isn't appliable
      nh () {
        case "$1" in
            (os|clean) command nh "$@" --ask;;
            (*) command nh "$@";;
        esac
      }
    '';

    shellAliases = {
      # annoying
      sudo = "sudo ";

      cleanup = "sudo nix-collect-garbage -d && nix-collect-garbage -d";

      did = "systemctl --user";
      had = "sudo systemctl";

      l = "eza --long";
      la = "eza --long --all";
      ls = "eza";

      cls = "clear";
      cat = "bat";
    };
  };
}
