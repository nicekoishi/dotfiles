(use-package catppuccin-theme
    :config
    (setq catppuccin-flavor 'mocha)
    (add-hook 'server-after-make-frame-hook #'catppuccin-reload)
    (load-theme 'catppuccin :no-confirm))

(set-face-attribute 'default nil
    :font "Iosevka Nerd Font"
    :height 130
    :weight 'medium)

(set-face-attribute 'variable-pitch nil
    :font "Iosevka Nerd Font"
    :height 140
    :weight 'medium)

(set-face-attribute 'fixed-pitch nil
    :font "Iosveka Nerd Font Propo"
    :height 130
    :weight 'medium)

(setq-default line-spacing 0.15)

(use-package evil
    :init
    (setq evil-want-integration t
          evil-want-keybinding nil
          evil-vsplit-window-right t
          evil-split-window-below t)
    :config
    (evil-mode))

(use-package evil-collection
    :after evil
    :config
    (setq evil-collection-mode-list '(dashboard dired ibuffer))
    (evil-collection-init))

(use-package general
    :config
    (general-evil-setup)

    (general-create-definer nc/leader-keys
        :states '(normal insert visual emacs)
        :keymaps 'override
        :prefix "SPC"
        :global-prefix "M-SPC")

    (nc/leader-keys
        "b"  '(:ignore t :wk "buffer")
        "bb" '(switch-to-buffer :wk "Switch to buffer")
        "bk" '(kill-current-buffer :wk "Kill this buffer")
        "bn" '(next-buffer :wk "Go to next buffer")
        "bp" '(previous-buffer :wk "Go to previous buffer")
        "br" '(revert-buffer :wk "Reload this buffer")))
