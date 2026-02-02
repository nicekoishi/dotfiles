# fufexan / dotfiles
{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (config.nice) user;
in {
  imports = [./gamescope.nix];

  config = mkIf user.apps.gaming {
    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
      extest.enable = true;

      extraCompatPackages = [
        pkgs.proton-ge-bin.steamcompattool # raw mouse input ftw
      ];

      # fix gamescope inside steam
      package = pkgs.steam.override {
        # https://github.com/ValveSoftware/steam-for-linux/issues/11057
        # https://github.com/ValveSoftware/steam-for-linux/issues/11057
        # NOTE: no need for that since we have extest now
        #extraProfile = "export SDL_VIDEODRIVER=x11";

        # 'temporary' fix for steamwebhelper not responding. Why is this even needed?
        # https://github.com/NixOS/nixpkgs/issues/353405#issuecomment-2455229831
        extraLibraries = pkgs:
          with pkgs; [
            xorg.libxcb
          ];

        extraPkgs = pkgs:
          with pkgs; [
            attr

            # ERROR: ld.so: object 'libgamemodeauto.so.0' from LD_PRELOAD cannot be preloaded (cannot open shared object file): ignored.
            # is there a way to fix this, or can it be ignored?
            gamemode

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
