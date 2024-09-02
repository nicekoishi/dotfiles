{pkgs, ...}: let
  catppuccin-mocha = pkgs.fetchzip {
    url = "https://raw.githubusercontent.com/catppuccin/prismlauncher/baa824d2738477ee54beb560ae992c834d43b757/themes/Mocha/Catppuccin-Mocha.zip";
    sha256 = "sha256-8uRqCoe9iSIwNnK13d6S4XSX945g88mVyoY+LZSPBtQ=";
  };
in {
  home = {
    file.".local/share/PrismLauncher/themes/mocha" = {
      source = catppuccin-mocha;
      recursive = true;
    };

    packages = let
      jdks = with pkgs; [
        # Java 8
        zulu8
        jre8

        # Java 11
        openjdk11-bootstrap

        # Java 17
        openjdk17

        # Latest
        zulu
      ];

      additionalPrograms = with pkgs; [
        gamemode
        mangohud
        #jprofiler failing to build because of some sha256 mismatch.
      ];
    in [
      (pkgs.prismlauncher.override {
        # this entire file was copy pasted from raf
        # thanks <3
        # also, wtf do i need multiple versions of java for this...
        inherit jdks;
        inherit additionalPrograms;
      })
    ];
  };
}
