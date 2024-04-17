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
        jnoortheen.nix-ide
        kamadorueda.alejandra
      ]
      ++ [pkgs.vscode-extensions."2gua".rainbow-brackets];

    userSettings = {
      "catppuccin.accentColor" = "teal";
      "editor.cursorBlinking" = "smooth";
      "editor.cursorSmoothCaretAnimation" = "explicit";
      "editor.fontFamily" = "Iosevka Nerd Font Propo";
      "editor.fontLigatures" = true;
      "editor.fontSize" = 16;
      "editor.formatOnSave" = true;
      "editor.guides.bracketPairs" = true;
      "editor.minimap.enabled" = false;
      "editor.smoothScrolling" = true;
      "nix.enableLanguageServer" = true;
      "security.workspace.trust.enabled" = false;
      "terminal.integrated.defaultProfile.linux" = "zsh";
      "terminal.integrated.gpuAcceleration" = "on";
      "window.menuBarVisibility" = "toggle";
      "window.restoreWindows" = "all";
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.iconTheme" = "catppuccin-mocha";
      "workbench.list.smoothScrolling" = true;
      "workbench.sideBar.location" = "right";
      "workbench.startupEditor" = "none";
      "todo-tree.highlights.customHighlight" = {
        "BUG" = {
          "icon" = "bug";
          "background" = "#f38ba8";
          "type" = "text";
        };
        "HACK" = {
          "icon" = "tools";
          "background" = "#f9e2af";
          "type" = "text";
        };
        "FIXME" = {
          "icon" = "flame";
          "background" = "#f38ba8";
          "type" = "text";
        };
        "XXX" = {
          "icon" = "x";
          "background" = "#f9e2af";
          "type" = "text";
        };
        "TODO" = {
          "icon" = "x";
          "background" = "#94e2d5";
          "type" = "text";
        };
      };
      "[cpp]" = {
        "editor.defaultFormatter" = "xaver.clang-format";
      };
    };
  };
}
