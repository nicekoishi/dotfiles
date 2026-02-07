{
  osConfig,
  lib,
  pkgs,
  ...
}: let
  inherit (osConfig.nice) user;
  inherit (lib.modules) mkIf;

  catppuccin-mocha = pkgs.fetchzip {
    url = "https://raw.githubusercontent.com/catppuccin/prismlauncher/baa824d2738477ee54beb560ae992c834d43b757/themes/Mocha/Catppuccin-Mocha.zip";
    sha256 = "sha256-8uRqCoe9iSIwNnK13d6S4XSX945g88mVyoY+LZSPBtQ=";
  };

  additionalPrograms = with pkgs; [
    gamemode
    mangohud
  ];

  jdks = with pkgs; [
    # Java 8
    jre8

    # Java 11
    openjdk11

    # Java 17
    openjdk17

    # Java 21
    openjdk21
  ];
in {
  config = mkIf user.apps.gaming {
    home = {
      file.".local/share/PrismLauncher/themes/mocha" = {
        source = catppuccin-mocha;
        recursive = true;
      };

      packages = [
        (pkgs.prismlauncher.override {
          inherit additionalPrograms;
          inherit jdks;
        })
      ];
    };
  };
}
