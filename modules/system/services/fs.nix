{
  config,
  lib,
  ...
}: let
  inherit (lib.attrsets) filterAttrs;
  fs = config.fileSystems;
in {
  services = {
    fstrim = {
      enable = true;
      interval = "weekly";
    };

    btrfs.autoScrub = {
      enable = (filterAttrs (_: val: val.fsType == "btrfs") fs) != {};
      interval = "weekly";
    };
  };

  # https://github.com/NotAShelf/nyx/blob/d407b4d6e5ab7f60350af61a3d73a62a5e9ac660/modules/core/common/system/os/fs/module.nix
  systemd.services.fstrim = {
    unitConfig.ConditionACPower = true;

    serviceConfig = {
      Nice = 19;
      IOSchedulingClass = "idle";
    };
  };
}
