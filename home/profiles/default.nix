{
  self,
  inputs,
  pkgs,
  ...
}: let
  extraSpecialArgs = {inherit inputs self;};
  hmConfig = {
    "polaris" = [
      ../.
      ./polaris
    ];
  };

  inherit (inputs.home-manager.lib) homeManagerConfiguration;
  _pkgs = inputs.nixpkgs.legacyPackages."${pkgs.system}";
in {
  _module.args = {inherit hmConfig;};

  flake = {
    homeConfigurations = {
      "@polaris" = homeManagerConfiguration {
        modules = hmConfig."polaris";
        inherit _pkgs extraSpecialArgs;
      };
      #...
    };
  };
}
