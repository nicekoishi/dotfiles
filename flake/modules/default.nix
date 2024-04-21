# shamelessy borrowed from raf as always
# notashelf/nyx
let
  mkModule = path:
    if builtins.isPath path
    then path
    else builtins.throw "${path} is not a real path! Are you stupid?";
in {
  flake = {
    nixosModules = {
      # provides a qemu hook for single gpu passthrough with options for custom configuration
      # it's still experimental, so feel free to open a PR
      gpu-pass = mkModule ./gpu-pass;

      default = builtins.throw "No default module, sorry!";
    };
  };
}
