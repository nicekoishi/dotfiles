{
  self,
  inputs,
  ...
}: let
  extraSpecialArgs = {inherit inputs self;};
  homeImports = {
    "polaris" = [
      ../.
      ./polaris
    ];
  };

  inherit (inputs.home-manager.lib) homeManagerConfiguration;
  pkgs = inputs.nixpkgs.legacyPackages."${pkgs.system}";
in {
  _module.args = {inherit homeImports;};

  flake = {
    homeConfigurations = {
      "@polaris" = homeManagerConfiguration {
        modules = homeImports."polaris";
        inherit pkgs extraSpecialArgs;
      };
    };
  };
}
