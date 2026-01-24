{
  config,
  inputs,
  inputs',
  self,
  self',
  ...
}: let
  lib = inputs.home-manager.lib // self.lib;
  usr = config.nice.user;

  inherit (lib.modules) mkIf;
in {
  config = {
    home-manager = mkIf usr.home-manager.enable {
      verbose = true;
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = {inherit lib inputs self inputs' self';};
      users.supeen.imports = ["${self}/home"];
      backupFileExtension = "hm.old";
    };
  };
}
