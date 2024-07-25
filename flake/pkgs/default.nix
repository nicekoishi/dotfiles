{
  systems = [
    "x86_64-linux"
    "aarch64-linux"
  ];

  perSystem = {
    config,
    pkgs,
    ...
  }: {
    packages = {
      funny-plymouth = pkgs.callPackage ./funny-plymouth {};

      suncord = pkgs.callPackage ./suncord {};
      suncord-web-extension = pkgs.callPackage ./suncord {buildWebExtension = true;};
      webcord-suncord = pkgs.callPackage ./webcord-suncord {
        inherit (config.packages) suncord-web-extension;
      };
    };
  };
}
