{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      dart-code.flutter
      jnoortheen.nix-ide
      kamadorueda.alejandra
      rust-lang.rust-analyzer
      vscode-icons-team.vscode-icons
    ];

    userSettings = {
      "editor.fontFamily" = "'Iosevka Nerd Font Mono', 'monospace', monospace";
      "files.autoSave" = "onFocusChange";
      "git.autofetch" = true;
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      "workbench.colorTheme" = "Catppuccin Macchiato";
      "workbench.productIconTheme" = "vscode-icons";
      "workbench.iconTheme" = "vscode-icons";
      "window.menuBarVisibility" = "compact";
    };
  };

  xdg.configFile."codium.conf".text = ''
    --enable-features=UseOzonePlatform
    --ozone-platform-hint=wayland
  '';
}
