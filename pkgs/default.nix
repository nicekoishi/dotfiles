{
  perSystem = {pkgs, ...}: {
    packages = {
      funny-plymouth = pkgs.callPackage ./funny-plymouth {};
    };
  };
}
