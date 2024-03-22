{pkgs, ...}: {
  programs = {
    bat = {
      enable = true;
      config = {
        pager = "less -FR";
        theme = "Catppuccin-macchiato";
      };
    };

    btop.enable = true;
    eza.enable = true;
  };
}
