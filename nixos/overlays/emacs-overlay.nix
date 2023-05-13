{config, lib, pkgs, inputs, ...}:

{
  environment.systemPackages = [
    inputs.emacs-overlay.packages.x86_64-linux.emacsGit
  ];
}
