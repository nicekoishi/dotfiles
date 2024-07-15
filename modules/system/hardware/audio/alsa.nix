# https://github.com/NotAShelf/nyx/blob/main/modules/core/common/system/hardware/multimedia/sound/servers/alsa.nix
{lib, ...}: {
  sound = lib.mapAttrs (_: lib.mkForce) {
    enable = false;
    mediaKeys.enable = false;
    enableOSSEmulation = false;
  };
}
