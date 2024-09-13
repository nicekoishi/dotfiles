{
  lib,
  pkgs,
  ...
}: let
  inherit (lib.options) literalExpression mkOption;
  inherit (lib.types) raw;
in {
  options.nice.host.system = {
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
  };
}
