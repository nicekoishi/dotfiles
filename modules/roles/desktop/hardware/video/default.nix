{
  config,
  lib,
  ...
}: let
  inherit (builtins) elem;
  inherit (lib.modules) mkIf;
  cfg = config.nice.host;
in {
  imports = [
    ./nvidia
  ];

  config = mkIf (elem "desktop" cfg.roles) {
    hardware.graphics = {
      enable = true;
      # remember to not blindly copy and paste stuff from others,
      # dumb moment
      enable32Bit = true;
    };
  };
}
