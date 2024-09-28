{
  lib,
  pkgs,
  ...
}: let
  inherit (lib) getExe;
  profiles = "${pkgs.firejail}/etc/firejail";
in {
  programs.firejail = {
    enable = true;
    # most of these will not work, as they're installed using home-manager
    wrappedBinaries = with pkgs; {
      mpv = {
        executable = "${getExe mpv}";
        profile = "${profiles}/mpv.profile";
      };

      thunderbird = {
        executable = "${getExe thunderbird}";
        profile = "${profiles}/thunderbird.profile";
      };

      viewnior = {
        executable = "${getExe viewnior}";
        profile = "${profiles}/viewnior.profile";
      };

      zathura = {
        executable = "${getExe zathura}";
        profile = "${profiles}/zathura.profile";
      };
    };
  };
}
