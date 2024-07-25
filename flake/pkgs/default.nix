{
  perSystem = {
    config,
    pkgs,
    ...
  }: {
    packages = let
      inherit (pkgs) callPackage;
    in {
      funny-plymouth = callPackage ./funny-plymouth {};

      suncord = callPackage ./suncord {};
      suncord-web-extension = callPackage ./suncord {buildWebExtension = true;};

      webcord-suncord = callPackage ./webcord-suncord {
        inherit (config.packages) suncord-web-extension;
      };
    };
  };
}
