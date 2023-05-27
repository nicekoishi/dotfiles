{inputs, ...}: {
  imports = [inputs.neovim-flake.homeManagerModules.default];

  programs.neovim-flake = {
    enable = true;
    settings.vim = {
      viAlias = false;
      vimAlias = true;

      dashboard = {
        alpha.enable = true;
      };

      languages = {
        enableLSP = true;
        enableTreesitter = true;
        enableFormat = true;

        # it's starting to become a mess
        html = {enable = true;};
        nix = {enable = true;};
        python = {enable = true;};
      };

      lineNumberMode = "number";
      lsp = {
        enable = true;
        formatOnSave = true;
        lightbulb.enable = true;
      };

      notes.orgmode.enable = true;

      tabWidth = 2;
      telescope.enable = true;
    };
  };
}
