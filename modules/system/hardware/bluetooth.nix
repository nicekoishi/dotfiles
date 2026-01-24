{config, ...}: let
  inherit (config.nice.host.opts) roles;
in {
  hardware.bluetooth.enable = builtins.elem "desktop" roles;
}
