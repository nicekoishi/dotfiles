{pkgs, ...}: {
  programs.zathura = {
    enable = true;
    options = {
      recolor-lightcolor = "rgba(0,0,0,0)";
      default-bg = "rgba(0,0,0,0.8)";

      font = "Iosevka Nerd Font 12";
      selection-notification = true;

      selection-clipboard = "clipboard";
      adjust-open = "best-fit";
      pages-per-row = "1";
      scroll-page-aware = "true";
      scroll-full-overlap = "0.01";
      scroll-step = "100";
    };

    extraConfig = "include catppuccin-macchiato";
  };

  xdg.configFile."zathura/catppuccin-macchiato".source = pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/catppuccin/zathura/main/src/catppuccin-macchiato";
    hash = "sha256-cuR2W/Iwd57XZ+rE/ldIhIPZOQcHZNLtQEl2rUpC4Ek=";
  };
}
