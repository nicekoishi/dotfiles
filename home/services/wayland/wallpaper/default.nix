{
  lib,
  osConfig,
  ...
}: let
  inherit (lib.attrsets) mapAttrs' nameValuePair;
  inherit (osConfig.nice.user.display) monitors;
in {
  services.wpaperd = {
    enable = true;
    # TODO: find a better way, this won't work as well if we want to add effects
    # also, "re:" may be useless here... but what if we need it?
    settings = mapAttrs' (_: value: nameValuePair ("re:" + value.description) {path = value.wallpaper;}) monitors;
  };
}
