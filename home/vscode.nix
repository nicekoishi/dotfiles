{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium-fhs;
    extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      dart-code.flutter
      dart-code.dart-code
      jnoortheen.nix-ide
      kamadorueda.alejandra
      rust-lang.rust-analyzer
      vscode-icons-team.vscode-icons
    ];

    userSettings = {
      "dart.flutterSdkPath" = "${pkgs.flutter}";
      "dart.sdkPath" = "${pkgs.dart}";
      "editor.fontFamily" = "'Iosevka Nerd Font Mono', 'monospace', monospace";
      "files.autoSave" = "onFocusChange";
      "git.autofetch" = true;
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nil";
      "window.menuBarVisibility" = "compact";
      "workbench.colorTheme" = "Catppuccin Macchiato";
      "workbench.iconTheme" = "vscode-icons";
      "workbench.productIconTheme" = "vscode-icons";
    };
  };

  xdg.configFile."codium.conf".text = ''
    --enable-features=UseOzonePlatform
    --ozone-platform-hint=wayland
  '';
}
