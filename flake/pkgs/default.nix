{
  systems = [
    "x86_64-linux"
    "aarch64-linux"
  ];

  perSystem = {pkgs, ...}: let
    inherit (pkgs) callPackage;
  in {
    packages = {
      funny-plymouth = callPackage ./funny-plymouth {};
    };
  };
}
