{
  pkgs,
  lib,
  ...
}: let
  inherit (lib.meta) getExe getExe';
in {
  systemd.user.services.cliphist = {
    Unit = {
      PartOf = ["graphical-session.target"];
      After = ["graphical-session.target"];
      Description = "Clipboard history service";
    };
    Install.WantedBy = ["graphical-session.target"];
    Service = {
      ExecStart = "${getExe' pkgs.wl-clipboard "wl-paste"} --watch ${getExe pkgs.cliphist} store";
    };
  };

  home.packages = with pkgs; [
    cliphist
    wl-clipboard
  ];
}
