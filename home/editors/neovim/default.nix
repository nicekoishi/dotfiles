{inputs, ...}: {
  imports = [inputs.neovim-flake.homeManagerModules.default];

  programs.neovim-flake = {
    enable = true;
    settings.vim = {
      enableEditorconfig = true;
      viAlias = true;
      vimAlias = true;
      debugMode = {
        enable = false;
        level = 20;
        logFile = "/tmp/nvim.log";
      };

      lsp = {
        formatOnSave = true;
        lightbulb.enable = true;
        lspSignature.enable = true;
        nvimCodeActionMenu.enable = true;
        trouble.enable = true;
      };

      ## i.e add stuff here to appear there (neovim ofc dumbass)
      languages = {
        enableExtraDiagnostics = true;
        enableFormat = true;
        enableLSP = true;
        enableTreesitter = true;

        html.enable = true;
        markdown.enable = true;
        nix.enable = true;
        python.enable = true;

<<<<<<< HEAD
=======
        ts = {
          enable = true;
          format.enable = true;
        };

>>>>>>> 12c72a1 (too lazy to separate them all)
        dart = {
          enable = true;
          flutter-tools.enable = true;
        };
        rust = {
          enable = true;
          crates.enable = true;
        };
      };

      lineNumberMode = "number";

      ## pretty boi
      visuals = {
        enable = true;
        cellularAutomaton.enable = true;
        fidget-nvim.enable = true;
        nvimWebDevicons.enable = true;
        scrollBar.enable = false;
        smoothScroll.enable = true;
<<<<<<< HEAD
        cursorWordline = {
=======
        cursorline = {
>>>>>>> 12c72a1 (too lazy to separate them all)
          enable = true;
          lineTimeout = 0;
        };
        indentBlankline = {
          enable = true;
          fillChar = null;
          eolChar = null;
<<<<<<< HEAD
          showCurrContext = true;
=======
          scope.enabled = true;
>>>>>>> 12c72a1 (too lazy to separate them all)
        };
      };
      statusline = {
        lualine = {
          enable = true;
<<<<<<< HEAD
          theme = "catppuccin";
=======
          theme = "gruvbox";
>>>>>>> 12c72a1 (too lazy to separate them all)
        };
      };

      theme = {
        enable = true;
<<<<<<< HEAD
        name = "catppuccin";
        style = "macchiato";
=======
        name = "gruvbox";
        style = "dark";
>>>>>>> 12c72a1 (too lazy to separate them all)
        transparent = false;
      };

      autopairs.enable = true;

      autocomplete = {
        enable = true;
        type = "nvim-cmp";
      };

      filetree = {
<<<<<<< HEAD
        nvimTreeLua = {
          enable = true;
          renderer = {
            rootFolderLabel = null;
          };
=======
        nvimTree = {
          enable = true;
          openOnSetup = false;
>>>>>>> 12c72a1 (too lazy to separate them all)
          view = {
            width = 25;
          };
        };
      };

      tabline = {
        nvimBufferline.enable = true;
      };

      treesitter.context.enable = true;

      binds = {
        whichKey.enable = true;
        cheatsheet.enable = true;
      };

      telescope.enable = true;

      git = {
        enable = true;
        gitsigns.enable = true;
        gitsigns.codeActions = false;
      };

      minimap = {
        minimap-vim.enable = false;
        codewindow.enable = true; # lighter, faster, and uses lua for configuration
      };

      dashboard = {
        dashboard-nvim.enable = false;
        alpha.enable = true;
      };

      notify = {
        nvim-notify.enable = true;
      };

      projects = {
        project-nvim.enable = true;
      };

      utility = {
        icon-picker.enable = true;
        diffview-nvim.enable = true;
        motion = {
          hop.enable = true;
          leap.enable = false;
        };
      };

      notes = {
        mind-nvim.enable = true;
        todo-comments.enable = true;
      };

      terminal = {
        toggleterm.enable = true;
      };

      ui = {
        noice.enable = true;
      };

      session = {
        nvim-session-manager.enable = true;
      };

      gestures = {
        gesture-nvim.enable = false;
      };

      comments = {
        comment-nvim.enable = true;
      };

      presence = {
<<<<<<< HEAD
        presence-nvim = {
=======
        neocord = {
>>>>>>> 12c72a1 (too lazy to separate them all)
          enable = true;
          auto_update = true;
          enable_line_number = true;
          show_time = true;
<<<<<<< HEAD
          image_text = "The Superior Text Editor";
          client_id = "793271441293967371";
          main_image = "neovim";
=======
          logo_tooltip = "The Superior Text Editor";
          client_id = "793271441293967371";
          main_image = "logo";
>>>>>>> 12c72a1 (too lazy to separate them all)
          rich_presence = {
            editing_text = "Editing %s";
          };
        };
      };
    };
  };
}
