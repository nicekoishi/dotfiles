{
  pkgs,
  lib,
  ...
}: let
  inherit (lib) getExe;
in {
  systemd.user.services.cliphist = {
    Unit = {
      PartOf = ["graphical-session.target"];
      After = ["graphical-session.target"];
      Description = "Clipboard history service";
    };
    Install.WantedBy = ["graphical-session.target"];
    Service = {
      ExecStart = "${pkgs.wl-clipboard}/bin/wl-paste --watch ${getExe pkgs.cliphist} store";
    };
  };

  home.packages = with pkgs; [
    cliphist
    wl-clipboard
  ];
}
