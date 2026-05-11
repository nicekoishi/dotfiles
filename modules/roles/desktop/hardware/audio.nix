{pkgs, ...}: {
  # BUG: home-manager can't set LADSPA_PATH properly, so we're using
  # putting this package here for a while.
  services.pipewire.extraLadspaPackages = [pkgs.rnnoise-plugin];
}
