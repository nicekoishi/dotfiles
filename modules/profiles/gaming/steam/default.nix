# fufexan / dotfiles
{pkgs, ...}: {
  imports = [./gamescope.nix];

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
}
