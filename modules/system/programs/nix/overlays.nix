{lib, ...}: {
  nixpkgs.overlays = [
    (_: prev: {
      vulkan-validation-layers = prev.vulkan-validation-layers.overrideAttrs (o: {
        buildInputs = o.buildInputs ++ [prev.spirv-tools];
      });
    })
  ];
}
