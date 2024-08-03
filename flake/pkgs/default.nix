{
  perSystem = {pkgs, ...}: {
    packages = let
      inherit (pkgs) callPackage;
    in {
      funny-plymouth = callPackage ./funny-plymouth {};
    };
  };
}
