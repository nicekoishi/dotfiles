{config, ...}: let
  cfg = config.nice.host;
in {
  hardware.bluetooth.enable = builtins.elem "desktop" cfg.roles;
}
