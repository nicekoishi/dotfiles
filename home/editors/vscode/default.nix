{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    enableExtensionUpdateCheck = true;
    enableUpdateCheck = true;

    # TODO: i may have forgot to add some extensions
    extensions = with pkgs.vscode-extensions;
      [
        # stuff that should be default
        christian-kohler.path-intellisense
        formulahendry.code-runner
        gruntfuggly.todo-tree
        ibm.output-colorizer
        irongeek.vscode-env
        naumovs.color-highlight
        oderwat.indent-rainbow
        usernamehw.errorlens
        yzhang.markdown-all-in-one

        # cpp
        ms-vscode.cpptools
        xaver.clang-format

        # catppuccin theme
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons

        # nix
        mkhl.direnv
        bbenoist.nix
        kamadorueda.alejandra
      ]
      ++ [pkgs.vscode-extensions."2gua".rainbow-brackets];
  };
}
