# fufexan / dotfiles
{
  pkgs,
  inputs,
  ...
}: {
  environment.systemPackages = [
    inputs.nix-gaming.packages.${pkgs.system}.wine-discord-ipc-bridge
  ];

  programs.steam = {
    enable = true;

    extraCompatPackages = [
      pkgs.proton-ge-bin # raw mouse input ftw
    ];

    # fix gamescope inside steam
    package = pkgs.steam.override {
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
}
