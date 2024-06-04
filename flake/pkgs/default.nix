{
  systems = [
    "x86_64-linux"
    "aarch64-linux"
  ];

  perSystem = {pkgs, ...}:
    with pkgs; {
      packages = {
        funny-plymouth = callPackage ./funny-plymouth {};
      };
    };
}
