{self, ...}: {
  perSystem = {
    inputs',
    pkgs,
    ...
  }: {
    packages = {
      # i want to shoot myself
      docs = inputs'.ndg.packages.ndg-builder.override {
        rawModules = [
          ../modules/options/extra
          ../modules/options/host
          ../modules/options/user
        ];

        specialArgs = {inherit pkgs;};

        title = "nicekoishi's options documentation - ${self.shortRev or self.dirtyShortRev}";
      };
    };
  };
}
