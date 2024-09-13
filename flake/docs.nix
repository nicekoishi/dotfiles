{self, ...}: {
  perSystem = {
    inputs',
    pkgs,
    ...
  }: {
    packages = {
      # i want to shoot myself
      docs = inputs'.ndg.packages.ndg-builder.override {
        title = "nicekoishi's options documentation - ${self.shortRev or self.dirtyShortRev}";
        embedResources = true;

        rawModules = [
          ../modules/options/extra
          ../modules/options/host
          ../modules/options/user
        ];

        specialArgs = {inherit pkgs;};
      };
    };
  };
}
