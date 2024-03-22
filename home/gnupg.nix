<<<<<<< HEAD
{config, ...}: {
=======
{
  config,
  pkgs,
  ...
}: {
>>>>>>> 12c72a1 (too lazy to separate them all)
  programs.gpg = {
    enable = true;
    homedir = "${config.xdg.dataHome}/gnupg";
  };
  services.gpg-agent = {
    enable = true;
    enableSshSupport = true;
<<<<<<< HEAD
    pinentryFlavor = "gnome3";
=======
    pinentryPackage = pkgs.pinentry-gnome3;
>>>>>>> 12c72a1 (too lazy to separate them all)
  };
}
