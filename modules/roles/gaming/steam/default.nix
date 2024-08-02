# fufexan / dotfiles
{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (builtins) elem;
  inherit (lib.modules) mkIf;
  cfg = config.nice.host;
in {
  imports = [./gamescope.nix];

  config = mkIf (elem "gaming" cfg.roles) {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;

      extraCompatPackages = [
        pkgs.proton-ge-bin.steamcompattool # raw mouse input ftw
      ];

      # fix gamescope inside steam
      package = pkgs.steam.override {
        # https://github.com/ValveSoftware/steam-for-linux/issues/11057
        # https://github.com/ValveSoftware/steam-for-linux/issues/11057
        extraProfile = "export SDL_VIDEODRIVER=x11";

        extraPkgs = pkgs:
          with pkgs; [
            keyutils
            libkrb5
            libpng
            libpulseaudio
            libvorbis
            stdenv.cc.cc.lib
            xorg.libXcursor
            xorg.libXi
            xorg.libXinerama
            xorg.libXScrnSaver
          ];
      };
    };
  };
}
