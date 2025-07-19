{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkForce;
in {
  programs.gpg = {
    enable = true;
    homedir = "${config.xdg.dataHome}/gnupg";
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = false;
    enableExtraSocket = true;

    pinentry.package = pkgs.pinentry-gnome3;
  };

  systemd.user.services.gpg-agent.Unit.RefuseManualStart = mkForce false;
}
