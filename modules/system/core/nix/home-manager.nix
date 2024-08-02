{
  inputs,
  inputs',
  self',
  self,
  ...
}: let
  lib = inputs.home-manager.lib // self.lib;

  specialArgs = {inherit lib inputs self inputs' self';};
in {
  imports = [inputs.home-manager.nixosModules.default];

  home-manager = {
    # keep yapping
    verbose = true;

    # parity between nixos' pkgs and hm's packages
    useGlobalPkgs = true;

    # users.users.<name>.packages, do I even use this?
    useUserPackages = true;

    extraSpecialArgs = specialArgs;

    users.supeen = import "${self}/home";

    # i actually added this before, but did git reset --hard because of that last commit
    # actually forgot to add again
    backupFileExtension = "hm.old";
  };
}
