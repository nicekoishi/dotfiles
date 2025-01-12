{inputs, ...}: {
  imports = [inputs.nvf.homeManagerModules.default];

  programs.neovim-flake = {
    enable = true;
    settings.vim = {
      enableLuaLoader = true;
      lineNumberMode = "number";
      preventJunkFiles = true;
      spellcheck.enable = true;
      useSystemClipboard = true;
      viAlias = true;
      vimAlias = true;

      autocomplete.nvim-cmp = {
        enable = true;
      };

      autopairs.nvim-autopairs = {
        enable = true;
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

          setupOpts = {
            disable_netrw = true;
            update_focused_file.enable = true;
            hijack_cursor = true;
            hijack_unnamed_buffer_when_opening = true;
            view.width = 25;
          };

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
        gitsigns.codeActions.enable = false;
      };

      # TODO: There will be more stuff here, probably
      globals = {
        editorconfig = true;
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
          enable = false;
          setupOpts = {
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
        # https://github.com/NotAShelf/nvf/issues/368#issuecomment-2316514657
        # If something breaks, disable this first.
        addDefaultGrammars = true;
      };

      ui = {
        noice.enable = true;
        illuminate.enable = true;
        fastaction.enable = true;

        borders = {
          enable = true;
          globalStyle = "rounded";
        };

        colorizer.enable = true;
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
        cellular-automaton.enable = false;
        cinnamon-nvim.enable = true;
        fidget-nvim.enable = true;
        highlight-undo.enable = true;
        nvim-web-devicons.enable = true;
        nvim-scrollbar.enable = false;

        indent-blankline = {
          enable = true;
          setupOpts.scope.enabled = true;
        };

        nvim-cursorline = {
          enable = true;
          setupOpts.line_timeout = 0;
        };
      };
    };
  };
}
