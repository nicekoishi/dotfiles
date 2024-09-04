{
  pkgs,
  self',
  ...
}: let
  inherit (pkgs) plymouth;
in {
  boot.plymouth = {
    enable = true;
    theme = "funny-plymouth";
    themePackages = [self'.packages.funny-plymouth];
  };

  # make plymouth work with sleep
  # https://github.com/NotAShelf/nyx/blob/d407b4d6e5ab7f60350af61a3d73a62a5e9ac660/modules/core/common/system/os/boot/plymouth.nix#L29C1-L37C7
  powerManagement = {
    powerDownCommands = ''
      ${plymouth} --show-splash
    '';
    resumeCommands = ''
      ${plymouth} --quit
    '';
  };
}
