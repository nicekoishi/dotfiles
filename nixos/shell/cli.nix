{ pkgs, ... }:

{
  programs = {
    bat = {
      enable = true;
      config = {
        pager = "less -FR";
        theme = "Catppuccin-macchiato";
      };
      themes = {
        Catppuccin-macchiato = builtins.readFile (pkgs.fetchurl {
          url = "https://raw.githubusercontent.com/catppuccin/bat/main/Catppuccin-macchiato.tmTheme";
          hash = "sha256-76fS4lq8obgOAYaKSVqBc2wOP+RLUCeTQL69vrUfs3k="; # why
        });
      };
    };

    btop.enable = true;
    exa.enable = true;
  };
}
