(setq native-comp-speed -1)
(setq package-enable-at-startup nil)

(menu-bar-mode -1)
(tool-bar-mode -1)
(global-display-line-numbers-mode 1)
(global-visual-line-mode t)

(fset #'yes-or-no-p #'y-or-n-p)

(message "Starting...")

(setq gc-cons-threshold (* 1024 1024 100)
    read-process-output-max (* 1024 1024))

(setq dots-home "@dots-home@"
      emacs-dots-home @emacs-dots-home@
      xdg-config-home "@xdg-config-home@"
      xdg-data-home "@xdg-data-home@")

(setq use-package-always-ensure t)

(org-babel-load-file
    (expand-file-name "config.org" emacs-dots-home))

(message "*** Emacs loaded in %s with %d garbage collections."
    (format "%.2f seconds"
        (float-time
        (time-subtract after-init-time before-init-time)))
    gcs-done)
