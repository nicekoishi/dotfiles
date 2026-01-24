{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (config.nice.host.opts) roles;
in {
  config = mkIf (builtins.elem "desktop" roles) {
    services.psd = {
      enable = true;
      resyncTimer = "30m";
    };

    # this is here because profile-sync-daemon needs gdbus available to resync on suspend
    # TODO: deal with psd config through nix only
    systemd.user.services = {
      psd.path = with pkgs; [glib];
      psd-resync.path = with pkgs; [glib];
    };
  };
}
