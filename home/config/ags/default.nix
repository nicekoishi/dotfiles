{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  inherit (inputs) ags;
  deps = with pkgs; [
    bash
    coreutils
    dart-sass
    fd
  ];
in {
  imports = [
    ags.homeManagerModules.default
  ];

  programs.ags.enable = true;

  systemd.user.services.ags = {
    Unit = {
      Description = "Aylur's Gtk Shell";
      PartOf = ["graphical-session.target"];
    };
    Service = {
      Environment = "PATH=/run/wrappers/bin:${lib.makeBinPath deps}";
      ExecStart = "${config.programs.ags.package}/bin/ags";
      Restart = "on-failure";
    };
    Install.WantedBy = ["graphical-session.target"];
  };
}
