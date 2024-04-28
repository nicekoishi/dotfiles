{
  self,
  inputs,
  ...
}: let
  extraSpecialArgs = {inherit inputs self;};
  homeImports = {
    "supeen" = [
      ../.
      ./supeen
    ];
  };

  inherit (inputs.home-manager.lib) homeManagerConfiguration;
  pkgs = inputs.nixpkgs.legacyPackages."${pkgs.system}";
in {
  _module.args = {inherit homeImports;};

  flake = {
    homeConfigurations = {
      "@polaris" = homeManagerConfiguration {
        modules = homeImports."supeen";
        inherit pkgs extraSpecialArgs;
      };
    };
  };
}
