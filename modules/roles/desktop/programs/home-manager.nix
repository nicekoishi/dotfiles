{
  config,
  inputs,
  inputs',
  self',
  self,
  ...
}: let
  lib = inputs.home-manager.lib // self.lib;
  inherit (lib.modules) mkIf;

  cfg = config.nice;
  usr = cfg.user;
  specialArgs = {inherit lib inputs self inputs' self';};
in {
  home-manager = mkIf usr.home-manager.enable {
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
