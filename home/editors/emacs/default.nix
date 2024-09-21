{
  config,
  inputs',
  pkgs,
  ...
}: let
  custom-emacs = pkgs.emacsWithPackagesFromUsePackage {
    # Despite the name, this only looks for instances of use-package
    # and pulls the corresponding package from nixpkgs
    config = ./config/config.org;

    # This is always loaded when you start Emacs, and it's loaded before
    # init.el is loaded.
    # Just like init.el, it can be skipped with `emacs -q`
    defaultInitFile = pkgs.replaceVars ./config/default.el {
      dots-home = "${config.xdg.userDirs.documents}/code/dots";

      # What the heck is this...
      emacs-dots-home = "(format \"%s/home/editors/emacs/config/\" dots-home)";

      xdg-config-home = config.xdg.configHome;
      xdg-data-home = config.xdg.dataHome;
    };

    # The main package of our Emacs 'package'. We use pgtk as we're on a wayland
    # only environment, but this should probably be set to normal Emacs when the
    # current system doesn't support it.
    package = inputs'.emacs-overlay.packages.emacs-pgtk;

    # Assumes that each instance of use-package contains `:ensure t`
    # This is used for some packages, as we can explicitly declare them
    # with `:ensure nil` instead of using `:ensure t` on every single package
    # Shouldn't be used without `use-package-always-ensure t`
    alwaysEnsure = true;

    # Tangle every source block in our config.org file.
    # By default, it only looks for blocks with :tangle yes on them
    # Shouldn't be used without #+PROPERTY: header-args:emacs-lisp :tangle yes
    alwaysTangle = true;
  };
in {
  home.packages = [custom-emacs];

  services.emacs = {
    enable = true;
    package = custom-emacs;
  };
}
