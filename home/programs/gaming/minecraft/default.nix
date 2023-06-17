{pkgs, ...}: let
  macchiato = pkgs.fetchzip {
    url = "https://github.com/catppuccin/prismlauncher/raw/main/themes/Macchiato/Catppuccin-Macchiato.zip";
    sha256 = "1m6nh7jzfkklhyazvh8navy8wkh2ghcm6xy1002dnrsmk6wgkdky";
  };

  javaPackages = with pkgs; [
    # Java 8
    temurin-jre-bin-8
    zulu8

    # Java 11
    temurin-jre-bin-11
    graalvm11-ce

    # Java 17
    temurin-jre-bin-17
    graalvm17-ce

    # Latest
    temurin-jre-bin
    zulu
  ];
in {
  home = {
    file.".local/share/PrismLauncher/themes/macchiato" = {
      source = macchiato;
      recursive = true;
    };

    packages = [
      (pkgs.prismlauncher.override {
        # this entire file was copy pasted from raf
        # thanks <3
        jdks = javaPackages;
      })
    ];
  };
}
