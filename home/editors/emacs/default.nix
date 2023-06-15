{pkgs, ...}: let
  emacs-pkg = pkgs.emacs29-pgtk;
in {
  services.emacs = {
    enable = true;
    package = emacs-pkg;
    defaultEditor = true;

    client = {
      enable = true;
      arguments = ["-c -a emacs"];
    };
  };

  programs.emacs = {
    enable = true;
    package = emacs-pkg;
  };

  xdg.configFile."emacs/early-init.el".text = ''
    (setq package-enable-at-startup nil)
    (message "*** Emacs loaded in %s with %d garbage collections."
        (format "%.2f seconds"
                 (float-time
                  (time-subtract after-init-time before-init-time))) gcs-done)
  '';

  xdg.configFile."emacs/init.el".text = ''
    (message "Starting...")

    (setq configFile (concat (replace-regexp-in-string "\n\\'" "" (shell-command-to-string "$SHELL --login -c 'echo -n $DOTS'")) "/home/editors/emacs/config/config.el"))
    (load configFile)
  '';

  home = {
    # dependencies for some emacs packages
    packages = with pkgs; [
      ripgrep
      coreutils
      fd
    ];
  };
}
