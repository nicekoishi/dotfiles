{pkgs, ...}: {
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
}
