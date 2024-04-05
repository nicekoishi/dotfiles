{pkgs, ...}: let
  javaPackages = with pkgs; [
    # Java 8
    temurin-jre-bin-8
    zulu8
    jre8

    # Java 11
    temurin-jre-bin-11
    openjdk11-bootstrap

    # Java 17
    temurin-jre-bin-17
    openjdk17

    # Latest
    temurin-jre-bin
    zulu
  ];
in {
  home.packages = [
    (pkgs.prismlauncher.override {
      # this entire file was copy pasted from raf
      # thanks <3
      jdks = javaPackages;
    })
  ];
}
