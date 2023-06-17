{inputs, ...}: {
  imports = [
    # HACK: this is here so I can install the packages with home manager
    # and block mihoyo's telemetry with networking.hosts
    inputs.aagl.nixosModules.default
  ];

  # TODO: this list can change, so remember to update this every week or so!
  networking.mihoyo-telemetry.block = true;
}
