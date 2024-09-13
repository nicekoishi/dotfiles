{
  lib,
  pkgs,
  ...
}: let
  inherit (lib.options) literalExpression mkOption;
  inherit (lib.types) bool raw;
in {
  options.nice.modules.host = {
    # https://github.com/NixOS/nixpkgs/blob/1355a0cbfeac61d785b7183c0caaec1f97361b43/nixos/modules/system/boot/kernel.nix#L40
    # defaultText is needed as ndg tries to eval the value, and it obviously fails as it's a kernel
    # I don't know why there's explicit throws there, but eh...
    kernel = mkOption {
      default = pkgs.linuxPackages_zen;
      type = raw;
      defaultText = literalExpression "pkgs.linuxPackages";
      example = literalExpression "pkgs.linuxPackages_latest";
      description = "The kernel to be used by the host";
    };

    waylandReady = mkOption {
      type = bool;
      internal = true;
      description = ''
        Whether the system has all the necessary requirements to
        run a Wayland compositor.

        This option should be set on your own discretion, as there
        isn't any kind of check to this.

        Severe case of trust me bro.
      '';
    };
  };
}
