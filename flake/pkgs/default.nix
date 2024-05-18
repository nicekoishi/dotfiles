{
  systems = [
    "x86_64-linux"
    "aarch64-linux"
  ];

  perSystem = {pkgs, ...}:
    with pkgs; {
      packages = {
        catppuccin-gtk = callPackage ./catppuccin-gtk {};
        funny-plymouth = callPackage ./funny-plymouth {};
      };
    };
}
