{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
in {
  config = mkIf config.programs.obs-studio.enable {
    # stupid resolve doesn't work with novideo
    # i can still use it on windows though, but kdenlive can do the trick
    home.packages = with pkgs; [
      libsForQt5.kdenlive
      #glaxnimate # dep for kdenlive, don't wanna override
    ];
  };
}
