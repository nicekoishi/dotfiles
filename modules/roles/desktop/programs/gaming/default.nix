{
  config,
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (config.nice) user;
in {
  imports = [
    ./steam

    ./gamemode.nix
  ];

  nice.host.opts = mkIf user.apps.gaming {
    profiles = ["gaming"];
  };
}
