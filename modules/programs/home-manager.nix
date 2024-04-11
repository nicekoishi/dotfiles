{inputs, ...}: {
  imports = [inputs.home-manager.nixosModules.default];

  home-manager = {
    # keep yapping
    verbose = true;

    # parity between nixos' pkgs and hm's packages
    useGlobalPkgs = true;

    # users.users.<name>.packages, do I even use this?
    useUserPackages = true;

    # i actually added this before, but did git reset --hard because of that last commit
    # actually forgot to add again
    backupFileExtension = "hm.old";
  };
}
