# 'borrowed' from notashelf/nyx
{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.fileset) fileFilter unions difference toSource;
  requiredDeps = with pkgs; [
    inputs.hyprland.packages.${pkgs.system}.default

    # scripts and helpers
    bash
    coreutils
    imagemagick
    libnotify
    ripgrep
  ];

  guiDeps = with pkgs; [
    networkmanagerapplet
    pavucontrol
  ];

  dependencies = requiredDeps ++ guiDeps;

  baseSrc = unions [
    ./js
    ./config.js
  ];

  filterNixFiles = fileFilter (file: lib.hasSuffix ".nix" file.name) ./.;
  filter = difference baseSrc filterNixFiles;
in {
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  programs.ags = {
    enable = true;
    configDir = toSource {
      root = ./.;
      fileset = filter;
    };
  };

  systemd.user.services.ags = {
    Unit = {
      Description = "Aylur's Gtk Shell";
      PartOf = ["graphical-session.target"];
    };
    Service = {
      Environment = "PATH=/run/wrappers/bin:${lib.makeBinPath dependencies}";
      ExecStart = "${config.programs.ags.package}/bin/ags";
      ExecReload = "${pkgs.coreutils}/bin/kill -SIGUSR2 $MAINPID";

      Restart = "on-failure";
      KillMode = "mixed";
    };
    Install.WantedBy = ["graphical-session.target"];
  };
}
