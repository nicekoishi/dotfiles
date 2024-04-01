{
  inputs,
  pkgs,
  ...
}: let
  # "borrowed" from outfoxxed, it solves my past treesitter problems
  newpkgs =
    pkgs.appendOverlays
    (with inputs.emacs-overlay.overlays; [
      emacs
      package

      (final: prev: {
        tree-sitter = prev.tree-sitter.override {
          extraGrammars = {
            tree-sitter-qmljs = {
              version = "master";
              src = pkgs.fetchFromGitHub {
                owner = "yuja";
                repo = "tree-sitter-qmljs";
                rev = "35ead5b9955cdb29bcf709d622fa960ff33992b6";
                sha256 = "jT47lEGuk6YUjcHB0ZMyL3i5PqyUaCQmt0j78cUpy8Q=";
              };
            };
          };
        };
      })
    ]);

  tree-sitter-parsers = grammars:
    with grammars; [
      tree-sitter-bash
      tree-sitter-css
      tree-sitter-elisp
      tree-sitter-html
      tree-sitter-javascript
      tree-sitter-json
      tree-sitter-json5
      tree-sitter-latex
      tree-sitter-markdown
      tree-sitter-markdown-inline
      tree-sitter-nix
      tree-sitter-python
      tree-sitter-qmljs
      tree-sitter-nix
      tree-sitter-rust
      tree-sitter-scss
      tree-sitter-toml
      tree-sitter-tsx
      tree-sitter-typescript
      tree-sitter-vim
      tree-sitter-yaml
    ];

  custom-emacs = with newpkgs; ((emacsPackagesFor (emacs29-pgtk.override {withNativeCompilation = true;})).emacsWithPackages (epkgs:
    with epkgs; let
      qml-ts-mode = trivialBuild {
        pname = "qml-ts-mode";
        version = "master";
        src = fetchFromGitHub {
          owner = "outfoxxed";
          repo = "qml-ts-mode";
          rev = "b24b9e78305ed045baa136782623ad16de01b7b8";
          sha256 = "PgXm/a92cX5zjA9blTrIRH7DfOUczRwb9oBcMMEzF2I=";
        };
      };
    in [
      (treesit-grammars.with-grammars (grammars: tree-sitter-parsers grammars))
      aggressive-indent
      catppuccin-theme
      company
      direnv
      doom-modeline
      editorconfig
      evil
      evil-collection
      evil-tutor
      flycheck
      fussy
      general
      lsp-mode
      lsp-treemacs
      lsp-ui
      minions
      nerd-icons
      nerd-icons-corfu
      nerd-icons-dired
      nerd-icons-ibuffer
      nix-mode
      org-bullets
      projectile
      qml-ts-mode
      rainbow-mode
      reformatter
      toc-org
      treemacs
      treemacs-evil
      treemacs-projectile
      vertico
      which-key
    ]));
in {
  services.emacs = {
    enable = true;
    package = custom-emacs;
  };

  xdg.configFile."emacs/early-init.el".text = ''
    (setq native-comp-speed -1)
    (setq package-enable-at-startup nil)

    (menu-bar-mode -1)
    (tool-bar-mode -1)
    (global-display-line-numbers-mode 1)
    (global-visual-line-mode t)

    (fset #'yes-or-no-p #'y-or-n-p)
  '';

  xdg.configFile."emacs/init.el".text = ''
    (message "Starting...")

    (org-babel-load-file
      (expand-file-name
      "config.org"
      user-emacs-directory))

    (setq gc-cons-threshold (* 1024 1024 100)
          read-process-output-max (* 1024 1024))

    (message "*** Emacs loaded in %s with %d garbage collections."
        (format "%.2f seconds"
                 (float-time
                  (time-subtract after-init-time before-init-time))) gcs-done)
  '';

  home = {
    # dependencies for some emacs packages
    packages = [custom-emacs];
  };
}
