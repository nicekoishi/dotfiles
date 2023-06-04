{
  pkgs,
  inputs,
  ...
}: let
  emacs-pkg = inputs.emacs-overlay.packages.${pkgs.system}.emacs-pgtk;
in {
  services.emacs = {
    enable = true;
    package = emacs-pkg;
    client.enable = true;
    startWithUserSession = "graphical";
  };

  programs.emacs = {
    enable = true;
    package = emacs-pkg;
  };
}
