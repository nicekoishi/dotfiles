{config, ...}: {
  virtualisation.waydroid.enable = builtins.elem "desktop" config.nice.host.opts.roles;
}
