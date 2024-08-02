{
  config,
  inputs,
  lib,
  ...
}: let
  inherit (builtins) elem;
  inherit (lib.modules) mkIf;
  cfg = config.nice.host;
in {
  imports = [inputs.aagl.nixosModules.default];

  config = mkIf (elem "gaming" cfg.roles) {
    nix.settings = inputs.aagl.nixConfig;
    programs = {
      anime-game-launcher.enable = true;
      honkers-railway-launcher.enable = true;
      sleepy-launcher.enable = true;
    };
  };
}
