{inputs, ...}: {
  imports = [inputs.neovim-flake.homeManagerModules.default];

  programs.neovim-flake = {
    enable = true;
    settings.vim = {
      enableEditorconfig = true;
      enableLuaLoader = true;
      preventJunkFiles = true;
      spellChecking.enable = true;
      useSystemClipboard = true;

      viAlias = true;
      vimAlias = true;

      lineNumberMode = "number";

      autopairs.enable = true;

      autocomplete = {
        enable = true;
        type = "nvim-cmp";
      };

      binds = {
        whichKey.enable = true;
        cheatsheet.enable = false;
      };

      comments = {
        comment-nvim.enable = true;
      };

      dashboard = {
        dashboard-nvim.enable = false;
        alpha.enable = true;
      };

      debugMode = {
        enable = false;
        logFile = "/tmp/nvim.log";
      };

      filetree = {
        nvimTree = {
          enable = true;
          openOnSetup = true;
          disableNetrw = true;
          updateFocusedFile.enable = true;

          hijackCursor = true;
          hijackUnnamedBufferWhenOpening = true;

          view.width = 25;

          mappings = {
            toggle = "<C-n>";
          };
        };
      };

      gestures = {
        gesture-nvim.enable = false;
      };

      git = {
        enable = true;
        gitsigns.enable = true;
        gitsigns.codeActions = false;
      };

      # i was under the influence when i made that previous comment
      languages = {
        enableExtraDiagnostics = true;
        enableFormat = true;
        enableLSP = true;
        enableTreesitter = true;

        bash.enable = true;
        css.enable = true;
        html.enable = true;
        markdown.enable = true;
        nix.enable = true;
        python.enable = true;
        ts.enable = true;

        dart = {
          enable = true;
          flutter-tools.enable = true;
        };
        rust = {
          enable = true;
          crates.enable = true;
        };
      };

      lsp = {
        formatOnSave = true;
        lightbulb.enable = true;
        lspSignature.enable = true;
        lspkind.enable = true;
        lsplines.enable = true;
        lspsaga.enable = false;
        nvim-docs-view.enable = true;
        nvimCodeActionMenu.enable = true;
        trouble.enable = false;
      };

      minimap = {
        minimap-vim.enable = false;
        codewindow.enable = true; # lighter, faster, and uses lua for configuration
      };

      notes = {
        mind-nvim.enable = true;
        todo-comments.enable = true;
      };

      notify = {
        nvim-notify.enable = true;
      };

      presence = {
        neocord = {
          enable = true;
          auto_update = true;
          enable_line_number = true;
          show_time = true;
          logo_tooltip = "The Superior Text Editor";
          client_id = "793271441293967371";
          main_image = "logo";
          rich_presence = {
            editing_text = "Editing %s";
          };
        };
      };

      projects = {
        project-nvim.enable = true;
      };

      session = {
        nvim-session-manager.enable = true;
      };

      statusline = {
        lualine = {
          enable = true;
          theme = "auto";
        };
      };

      tabline = {
        nvimBufferline.enable = true;
      };

      telescope.enable = true;

      terminal = {
        toggleterm = {
          enable = true;
          lazygit = {
            enable = true;
            direction = "tab";
          };
        };
      };

      theme = {
        enable = true;
        name = "catppuccin";
        style = "mocha";
        transparent = true;
      };

      treesitter = {
        fold = true;
        context.enable = true;
      };

      ui = {
        noice.enable = true;

        colorizer = {
          enable = true;

          filetypes = {
            css = {};
            scss = {};
            nix = {};
          };

          options = {
            css = true;
            css_fn = true;
            hsl_fn = true;
            rgb_fn = true;
            rrggbbaa = true;
            sass = true;
          };
        };
      };

      utility = {
        icon-picker.enable = true;
        diffview-nvim.enable = true;
        motion = {
          hop.enable = true;
          leap.enable = false;
        };
      };

      ## pretty boi
      visuals = {
        enable = true;
        cellularAutomaton.enable = true;
        fidget-nvim.enable = true;
        nvimWebDevicons.enable = true;
        scrollBar.enable = false;
        smoothScroll.enable = true;
        cursorline = {
          enable = true;
          lineTimeout = 0;
        };
        indentBlankline = {
          enable = true;
          fillChar = null;
          eolChar = null;
          scope.enabled = true;
        };
      };
    };
  };
}
