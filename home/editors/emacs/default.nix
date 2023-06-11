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
}
