{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = false;

    # TODO: i may have forgot to add some extensions
    extensions = with pkgs.vscode-extensions; [
      # stuff that should be default
      christian-kohler.path-intellisense
      usernamehw.errorlens
      gruntfuggly.todo-tree

      # nix
      mkhl.direnv
      jnoortheen.nix-ide
      kamadorueda.alejandra

      # vim keybinds
      vscodevim.vim

      # css colors
      kamikillerto.vscode-colorize

      # catppuccin theme
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
    ];
  };
}
