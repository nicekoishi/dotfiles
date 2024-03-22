{
  config,
  lib,
  ...
}: {
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
<<<<<<< HEAD
    enableAutosuggestions = true;
    autocd = true;
    dirHashes = {
      dl = "$HOME/Downloads";
      docs = "$HOME/Documentos";
      dots = "$HOME/Documentos/dots-flake";
      dev = "$HOME/Documentos/Dev";
      xvids = "$HOME/Vídeos";
=======
    autosuggestion.enable = true;
    autocd = true;
    dirHashes = {
      dl = "$HOME/Downloads";
      docs = "$HOME/Documents";
      dots = "$HOME/Documents/dots";
      dev = "$HOME/Documents/Dev";
      xvids = "$HOME/Videos";
>>>>>>> 12c72a1 (too lazy to separate them all)
    };
    dotDir = ".config/zsh";
    history = {
      expireDuplicatesFirst = true;
      path = "${config.xdg.dataHome}/zsh_history";
    };

    initExtra = ''
      # case insensitive tab completion
      zstyle ':completion:*' completer _complete _ignored _approximate
      zstyle ':completion:*' list-colors '\'
      zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
      zstyle ':completion:*' menu select
      zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
      zstyle ':completion:*' verbose true
      _comp_options+=(globdots)

      ${lib.optionalString config.services.gpg-agent.enable ''
        gnupg_path=$(ls $XDG_RUNTIME_DIR/gnupg)
        export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gnupg/$gnupg_path/S.gpg-agent.ssh"
      ''}
    '';

    shellAliases = {
<<<<<<< HEAD
      l = "exa -l";
      la = "exa -la";
      ls = "exa";
=======
      l = "eza -l";
      la = "eza -la";
      ls = "eza";
>>>>>>> 12c72a1 (too lazy to separate them all)
      cls = "clear";

      rebuild = "doas nixos-rebuild switch --flake ~dots/#$(hostname)";
      update = "nix flake update ~dots"; # running as root fucks up permissions dumb

      did = "systemctl --user";
      had = "doas systemctl";
    };

<<<<<<< HEAD
    shellGlobalAliases = {exa = "exa --icons --git --group-directories-first";};
=======
    shellGlobalAliases = {eza = "eza --icons --git --group-directories-first";};
>>>>>>> 12c72a1 (too lazy to separate them all)
  };
}
