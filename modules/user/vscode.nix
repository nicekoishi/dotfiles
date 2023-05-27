{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      jnoortheen.nix-ide
      kamadorueda.alejandra
      rust-lang.rust-analyzer
    ];

    userSettings = {
      "nix.enableLanguageServer" = "true";
      "nix.serverPath" = "nil";
      "workbench.colorTheme" = "Catppuccin Macchiato";
    };
  };

  xdg.configFile."codium.conf".text = ''
    --enable-features=UseOzonePlatform
    --ozone-platform-hint=wayland
  '';
}
