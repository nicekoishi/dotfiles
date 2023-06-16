(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(setq straight-use-package-by-default 't)

;; This is done to avoid org version mismatch
(straight-use-package 'org)

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (evil-mode)
  (use-package evil-collection
    :after evil
    :config
    (evil-collection-init))
  (use-package evil-tutor))

(use-package general
  :config
  (general-evil-setup)

  (general-create-definer no/leader-keys
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC" ;; leader key
    :global-prefix "M-SPC" ;; leader in insert mode
    )

(no/leader-keys
  "b"  '(:ignore t :wk "Buffer")
  "b b" '(switch-to-buffer :wk "Switch buffer")
  "b i" '(ibuffer :wk "List buffers")
  "b k" '(kill-this-buffer :wk "Kill current buffer")
  "b n" '(next-buffer :wk "Next buffer")
  "b p" '(previous-buffer :wk "Previous buffer")
  "b r" '(revert-buffer :wk "Reload buffer"))

(no/leader-keys
  "e" '(:ignore t :wk "Evaluate")
  "e b" '(eval-buffer :wk "Evaluate elisp in buffer")
  "e d" '(eval-defun :wk "Evaluate defun containing or after point")
  "e e" '(eval-expression :wk "Evaluate and elisp expression")
  "e l" '(eval-last-sexp :wk "Evaluate elisp expression before point")
  "e r" '(eval-region :wk "Evaluate elisp in region"))

(no/leader-keys
  "."  '(find-file :wk "Find file")
  "TAB TAB" '(comment-line :wk "Comment lines")
  "f p" '((lambda () (interactive) (find-file "~/Documentos/dots-flake/home/editors/emacs/config/config.org")) :wk "Edit emacs configuration")
  "f r" '(recentf-open :wk "Recent files"))

(no/leader-keys
  "h" '(:ignore t :wk "pls help")
  "h f" '(describe-function :wk "Describe function")
  "h v" '(describe-variable :wk "Describe variable")
  "h r r" '(nice/reload-init-file :wk "Reload emacs config"))

(no/leader-keys
  "p" '(:ignore t :wk "Projectile")
  "p p" '(projectile-dired :wk "Projectile Dired"))

(no/leader-keys
  "t" '(:ignore t :wk "Toggle")
  "t l" '(display-line-numbers-mode :wk "Toggle line numbers")
  "t t" '(visual-line-mode :wk "Toggle truncated lines"))
) ;; rember if adding new leader-keys, add this parenthesis or emacs will hate u

(use-package corfu
  ;; Optional customizations
  :custom
  (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  (corfu-auto t)                 ;; Enable auto completion
  (setq-default corfu-auto-prefix 0
		corfu-auto-delay 0)
  ;; (corfu-separator ?\s)          ;; Orderless field separator
  ;; (corfu-quit-at-boundary nil)   ;; Never quit at completion boundary
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect 'prompt)      ;; Preselect the prompt
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  ;; (corfu-scroll-margin 5)        ;; Use scroll margin

  ;; Enable Corfu only for certain modes.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  ;; Recommended: Enable Corfu globally.
  ;; This is recommended since Dabbrev can be used globally (M-/).
  ;; See also `corfu-exclude-modes'.

  (use-package kind-icon
    :after corfu
    :custom
    (kind-icon-default-face 'corfu-default)
    :config
    (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

  ;; This function enables corfu in minibuffer
  (defun corfu-enable-in-minibuffer ()
  "Enable Corfu in the minibuffer if `completion-at-point' is bound."
  (when (where-is-internal #'completion-at-point (list (current-local-map)))
    ;; (setq-local corfu-auto nil) ;; Enable/disable auto completion
    (setq-local corfu-echo-delay nil ;; Disable automatic echo and popup
		corfu-popupinfo-delay nil)
    (corfu-mode 1)))
  (add-hook 'minibuffer-setup-hook #'corfu-enable-in-minibuffer)
  :init
  (global-corfu-mode))

(use-package aggressive-indent
  :init
  (global-aggressive-indent-mode 1)
  :config
  ;; Maybe I will put rust here
  (add-to-list 'aggressive-indent-excluded-modes 'html-mode)
  ;; C being funky, stop pls
  (add-to-list 'aggressive-indent-dont-indent-if
               '(and (derived-mode-p 'c++-mode)
                     (null (string-match "\\([;{}]\\|\\b\\(if\\|for\\|while\\)\\b\\)"
                                         (thing-at-point 'line))))))

(use-package emmet-mode
  :ensure t
  :hook
  ;; Enables emmet's CSS abbreviation
  (css-mode-hook . emmet-mode)
  ;; Auto-start emmet on any markup mode
  (sgml-mode-hook . emmet-mode))

(setq dired-listing-switches "-alhv --group-directories-first --color=always")

;; does this even work?
(setq electric-pair-pairs `((123 . 125) ; { }
                            (40 . 41)   ; ( )
                            (91 . 93)   ; [ ]
                            (34 . 34)   ; " "
                            (96 . 39)   ; ` '
                            (8216 . 8217) ; ‘ ’
                            (8220 . 8221))) ; “ ”
(electric-pair-mode 1)

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (setq gc-cons-threshold 100000000
        read-process-output-max (* 1024 1024)
        lsp-idle-delay 0.500
        lsp-log-io nil)
  :hook (
         (prog-mode . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands (lsp lsp-deferred))

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package nix-mode
  :mode ("\\.nix\\'" "\\.nix.in\\'")
  :init

  ;; Another one from doom emacs, this treats flake.lock files as json.
  (add-to-list 'auto-mode-alist
               (cons "/flake\\.lock\\'"
                     (if (featurep 'json-mode)
                         'json-mode
                       'js-mode))))

(defun org-auto-tangle ()
  (when (eq major-mode 'org-mode)
    (org-babel-tangle)))

(add-hook 'after-save-hook 'org-auto-tangle)

(electric-indent-mode -1)

(add-hook 'org-mode-hook 'org-indent-mode)
(use-package org-superstar)
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))

(use-package toc-org
  :commands toc-org-enable
  :init (add-hook 'org-mode-hook 'toc-org-enable))

(require 'org-tempo)

(setq org-src-window-setup 'current-window)

(defun nice/treesit-install-all-languages ()
  "Install all languages specified by `treesit-language-source-alist'."
  (interactive)
  (let ((languages (mapcar 'car treesit-language-source-alist)))
    (dolist (lang languages)
      (treesit-install-language-grammar lang)
      (message "`%s' parser was installed." lang)
      (sit-for 0.75))))

(defun nice/reload-init-file ()
  (interactive)
  (load-file user-init-file)
  (load-file user-init-file))

(defvar nice/default-font-size 120
  "Default font size for fixed pitch")

(defvar nice/default-variable-font-size 140
  "Default font size for variable pitch")

(set-face-attribute 'default nil
                    :font "Iosevka Nerd Font"
                    :height nice/default-font-size
                    :weight 'medium)
(set-face-attribute 'variable-pitch nil
                    :font "JetBrainsMonoNL Nerd Font"
                    :height nice/default-variable-font-size
                    :weight 'medium)
(set-face-attribute 'font-lock-comment-face nil
                    :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil
                    :slant 'italic)

;; I mean, DT added it and it kinda makes difference
;; so I'm adding this too
(add-to-list 'default-frame-alist '(font . "Iosevka Nerd Font-12"))

(setq-default line-spacing 0.12)

(use-package format-all
  :init
  (add-hook 'format-all-mode-hook 'format-all-ensure-formatter)
  (add-hook 'prog-mode-hook 'format-all-mode)
  :config
  (setq format-all-show-errors 'warnings))

(setq-default format-all-default-formatters
      '(("Assembly" asmfmt)                   ;;
        ("ATS" atsfmt)                        ;;
        ("Bazel" buildifier)                  ;;
        ("BibTeX" emacs-bibtex)               ;;
        ("C" clang-format)                    ;; clang-format, astyle 
        ("C#" csharpier)                      ;; clang-format, csharpier, astyle 
        ("C++" clang-format)                  ;; clang-format, astyle
        ("Cabal Config" cabal-fmt)            ;;
        ("Clojure" zprint)                    ;; zprint, node-cljfmt
        ("CMake" cmake-format)                ;;
        ("Crystal" crystal)                   ;;
        ("CSS" prettier)                      ;; prettier, prettierd
        ("Cuda" clang-format)                 ;;
        ("D" dfmt)                            ;;
        ("Dart" dart-format)                  ;; dartfmt, dart-format
        ("Dhall" dhall)                       ;;
        ("Dockerfile" dockfmt)                ;;
        ("Elixir" mix-format)                 ;;
        ("Elm" elm-format)                    ;;
        ("Emacs Lisp" emacs-lisp)             ;;
        ("Erlang" efmt)                       ;;
        ("F#" fantomas)                       ;;
        ("Fish" fish-indent)                  ;;
        ("Fortran Free Form" fprettify)       ;;
        ("GLSL" clang-format)                 ;;
        ("Go" gofmt)                          ;; gofmt, goimports
        ("GraphQL" prettier)                  ;; prettier, prettierd
        ("Haskell" brittany)                  ;; brittany, fourmolu, hindent, ormolu, stylish-haskell
        ("HTML" html-tidy)                    ;;
        ("HTML+EEX" mix-format)               ;;
        ("HTML+ERB" erb-format)               ;;
        ("Java" clang-format)                 ;; clang-format, astyle
        ("JavaScript" prettier)               ;; prettier, standard, prettierd, deno 
        ("JSON" prettier)                     ;; prettier, standard, prettierd, deno
        ("JSON5" prettier)                    ;; prettier, standard, prettierd, deno
        ("Jsonnet" jsonnetfmt)                ;;
        ("JSX" prettier)                      ;; prettier, standard, prettierd, deno
        ("Kotlin" ktlint)                     ;;
        ("LaTeX" latexindent)                 ;; latexindent, auctex
        ("Less" prettier)                     ;;
        ("Literate Haskell" brittany)         ;;
        ("Lua" lua-fmt)                       ;; lua-fmt, stylua, prettier plugin
        ("Markdown" prettier)                 ;; prettier, prettierd, deno
        ("Nix" alejandra)                     ;; nixpkgs-fmt, nixfmt, alejandra
        ("Objective-C" clang-format)          ;; clang-format, astyle
        ("OCaml" ocp-indent)                  ;; ocp-indent, ocamlformat
        ("Perl" perltidy)                     ;; 
        ("PHP" prettier)                      ;;
        ("Protocol Buffer" clang-format)      ;;
        ("PureScript" purty)                  ;; purty, purescript-tidy
        ("Python" black)                      ;; black, yapf, isort
        ("R" styler)                          ;; 
        ("Reason" bsrefmt)                    ;;
        ("ReScript" rescript)                 ;;
        ("Ruby" rufo)                         ;; rubocop, rufo, standardrb, stree
        ("Rust" rustfmt)                      ;;
        ("Scala" scalafmt)                    ;;
        ("SCSS" prettier)                     ;;
        ("Shell" shfmt)                       ;; beautysh, shfmt
        ("Solidity" prettier)                 ;; pgformatter, sqlformat
        ("SQL" sqlformat)                     ;;
        ("Svelte" prettier)                   ;;
        ("Swift" swiftformat)                 ;;
        ("Terraform" terraform-fmt)           ;;
        ("TOML" prettier)                     ;; prettier, taplo fmt
        ("TSX" prettier)                      ;; prettier, ts-standard, prettierd, deno
        ("TypeScript" prettier)               ;; prettier, ts-standard, prettierd, deno
        ("V" v-fmt)                           ;;
        ("Verilog" istyle-verilog)            ;; iStyle, Verible
        ("Vue" prettier)                      ;; prettier, prettierd
        ("XML" html-tidy)                     ;; 
        ("YAML" prettier)                     ;; prettier, prettierd
        ("Zig" zig)                           ;;

        ("_Angular" prettier)                 ;;
        ("_Beancount" bean-format)            ;;
        ("_Caddyfile" caddy-fmt)              ;;
        ("_Flow" prettier)                    ;;
        ("_Gleam" gleam)                      ;;
        ("_Ledger" ledger-mode)               ;;
        ("_Nginx" nginxfmt)                   ;;
        ("_Snakemake" snakefmt)))             ;;

(define-format-all-formatter alejandra
                             (:executable "alejandra")
                             (:install "nix-env -if https://github.com/kamadorueda/alejandra/tarball/master")
                             (:languages "Nix")
                             (:features)
                             (:format (format-all--buffer-easy executable "--quiet")))



(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq create-lockfiles nil)

(use-package nerd-icons
  :after corfu
  :config
  (use-package nerd-icons-completion
    :config
    (nerd-icons-completion-mode))

  (use-package nerd-icons-ibuffer
    :hook (ibuffer-mode . nerd-icons-ibuffer-mode)
    :config
    (setq nerd-icons-ibuffer-icon-size 0.8))

  (use-package nerd-icons-dired
    :hook
    (dired-mode . nerd-icons-dired-mode))

  (setq kind-icon-use-icons nil)
  (setq kind-icon-mapping
        `(
          (array ,(nerd-icons-codicon "nf-cod-symbol_array") :face font-lock-type-face)
          (boolean ,(nerd-icons-codicon "nf-cod-symbol_boolean") :face font-lock-builtin-face)
          (class ,(nerd-icons-codicon "nf-cod-symbol_class") :face font-lock-type-face)
          (color ,(nerd-icons-codicon "nf-cod-symbol_color") :face success)
          (command ,(nerd-icons-codicon "nf-cod-terminal") :face default)
          (constant ,(nerd-icons-codicon "nf-cod-symbol_constant") :face font-lock-constant-face)
          (constructor ,(nerd-icons-codicon "nf-cod-triangle_right") :face font-lock-function-name-face)
          (enummember ,(nerd-icons-codicon "nf-cod-symbol_enum_member") :face font-lock-builtin-face)
          (enum-member ,(nerd-icons-codicon "nf-cod-symbol_enum_member") :face font-lock-builtin-face)
          (enum ,(nerd-icons-codicon "nf-cod-symbol_enum") :face font-lock-builtin-face)
          (event ,(nerd-icons-codicon "nf-cod-symbol_event") :face font-lock-warning-face)
          (field ,(nerd-icons-codicon "nf-cod-symbol_field") :face font-lock-variable-name-face)
          (file ,(nerd-icons-codicon "nf-cod-symbol_file") :face font-lock-string-face)
          (folder ,(nerd-icons-codicon "nf-cod-folder") :face font-lock-doc-face)
          (interface ,(nerd-icons-codicon "nf-cod-symbol_interface") :face font-lock-type-face)
          (keyword ,(nerd-icons-codicon "nf-cod-symbol_keyword") :face font-lock-keyword-face)
          (macro ,(nerd-icons-codicon "nf-cod-symbol_misc") :face font-lock-keyword-face)
          (magic ,(nerd-icons-codicon "nf-cod-wand") :face font-lock-builtin-face)
          (method ,(nerd-icons-codicon "nf-cod-symbol_method") :face font-lock-function-name-face)
          (function ,(nerd-icons-codicon "nf-cod-symbol_method") :face font-lock-function-name-face)
          (module ,(nerd-icons-codicon "nf-cod-file_submodule") :face font-lock-preprocessor-face)
          (numeric ,(nerd-icons-codicon "nf-cod-symbol_numeric") :face font-lock-builtin-face)
          (operator ,(nerd-icons-codicon "nf-cod-symbol_operator") :face font-lock-comment-delimiter-face)
          (param ,(nerd-icons-codicon "nf-cod-symbol_parameter") :face default)
          (property ,(nerd-icons-codicon "nf-cod-symbol_property") :face font-lock-variable-name-face)
          (reference ,(nerd-icons-codicon "nf-cod-references") :face font-lock-variable-name-face)
          (snippet ,(nerd-icons-codicon "nf-cod-symbol_snippet") :face font-lock-string-face)
          (string ,(nerd-icons-codicon "nf-cod-symbol_string") :face font-lock-string-face)
          (struct ,(nerd-icons-codicon "nf-cod-symbol_structure") :face font-lock-variable-name-face)
          (text ,(nerd-icons-codicon "nf-cod-text_size") :face font-lock-doc-face)
          (typeparameter ,(nerd-icons-codicon "nf-cod-list_unordered") :face font-lock-type-face)
          (type-parameter ,(nerd-icons-codicon "nf-cod-list_unordered") :face font-lock-type-face)
          (unit ,(nerd-icons-codicon "nf-cod-symbol_ruler") :face font-lock-constant-face)
          (value ,(nerd-icons-codicon "nf-cod-symbol_field") :face font-lock-builtin-face)
          (variable ,(nerd-icons-codicon "nf-cod-symbol_variable") :face font-lock-variable-name-face)
          (t ,(nerd-icons-codicon "nf-cod-code") :face font-lock-warning-face))))

(global-display-line-numbers-mode 1)
(global-visual-line-mode t)

(use-package doom-modeline
  :config
  ;; minions! well i find this cool so lets install it
  (use-package minions
    :config (minions-mode 1))
  ;; Actual doom-modeline settings
  (setq doom-modeline-hud t
        doom-modeline-height 27
        doom-modeline-bar-width 2
        doom-modeline-window-width-limit 80
        doom-modeline-buffer-file-name-style 'relative-from-project
        doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode html-mode))
  :hook (after-init . doom-modeline-mode))

(add-to-list 'default-frame-alist '(alpha-background . 78))

(use-package catppuccin-theme
  :config
  (setq catppuccin-flavor 'macchiato)
  (load-theme 'catppuccin t)

  ;; line numbers are almost invisible with background alpha
  (custom-set-faces '(line-number ((t (:foreground "#656a7a"))))))

(use-package projectile
  :init
  (projectile-mode +1)
  :config
  (setq projectile-project-search-path '("~/Documentos")))

(require 'treesit)

(setq treesit-language-source-alist
      '((bash . ("https://github.com/tree-sitter/tree-sitter-bash"))
        (c . ("https://github.com/tree-sitter/tree-sitter-c"))
        (cpp . ("https://github.com/tree-sitter/tree-sitter-cpp"))
        (css . ("https://github.com/tree-sitter/tree-sitter-css"))
        (go . ("https://github.com/tree-sitter/tree-sitter-go"))
        (html . ("https://github.com/tree-sitter/tree-sitter-html"))
        (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript"))
        (json . ("https://github.com/tree-sitter/tree-sitter-json"))
        (lua . ("https://github.com/Azganoth/tree-sitter-lua"))
        (make . ("https://github.com/alemuller/tree-sitter-make"))
        (python . ("https://github.com/tree-sitter/tree-sitter-python"))
        (php . ("https://github.com/tree-sitter/tree-sitter-php"))
        (ruby . ("https://github.com/tree-sitter/tree-sitter-ruby"))
        (rust . ("https://github.com/tree-sitter/tree-sitter-rust"))
        (sql . ("https://github.com/m-novikov/tree-sitter-sql"))
        (toml . ("https://github.com/tree-sitter/tree-sitter-toml"))
        (zig . ("https://github.com/GrayJack/tree-sitter-zig"))
        ;; add more here dumb
        ))

(add-to-list 'major-mode-remap-alist
             '(sh-mode . bash-ts-mode))

;; Enable vertico
(use-package vertico
  :init
  (vertico-mode)
  (setq vertico-resize nil
        vertico-count 14
        vertico-cycle t)
  :config
  (setq read-file-name-completion-ignore-case t
        read-buffer-completion-ignore-case t
        completion-ignore-case t)
  )

;; Persist history over Emacs restarts. Vertico sorts by history position.
(use-package savehist
  :init
  (savehist-mode))

;; A few more useful configurations...
(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
  ;; Vertico commands are hidden in normal buffers.
  (setq read-extended-command-predicate
        #'command-completion-default-include-p)

  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t)

  ;; TAB cycle if few candidates
  (setq completion-cycle-threshold 3)

  ;; Indentation+completion with TAB key
  (setq tab-always-indent 'complete))

;; Optionally use the `orderless' completion style.
(use-package orderless
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-consult-dispatch orderless-affix-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(substring orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles . (partial-completion))))))

(use-package which-key
  :init
  (which-key-mode 1)
  :config
  (setq which-key-side-window-location 'bottom
        which-key-sort-order #'which-key-key-order-alpha
        which-key-sort-uppercase-first nil
        which-key-add-column-padding 1
        which-key-max-display-columns nil
        which-key-min-display-lines 6
        which-key-side-window-slot -10
        which-key-side-window-max-height 0.25
        which-key-idle-delay 0.8
        which-key-max-description-lenght 25
        which-key-allow-imprecise-window-fit t
        which-key-separator "    "
        ))
