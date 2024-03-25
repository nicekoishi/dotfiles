{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: let
  inherit (inputs) ags hypr-contrib;
  cfg = config.programs.ags;

  deps = with pkgs; [
    #required
    config.wayland.windowManager.hyprland.package
    bash
    coreutils
    imagemagick
    ripgrep
    util-linux
    #gui
    mission-center
  ];
in {
  imports = [ags.homeManagerModules.default];

  home.packages = with pkgs; [
    hypr-contrib.packages.${pkgs.system}.grimblast

    hyprpicker
    swaynotificationcenter
    wl-clipboard
    libnotify
  ];

  # a bunch of ags stuff, too lazy to make a separate file
  # okay i got it from fufexan/dotfiles
  programs.ags = {
    enable = true;

    #configDir = ../config/ags;
  };

  systemd.user.services = {
    ags = {
      Unit.Description = "Aylur's GTK Shell";
      Unit.PartOf = ["graphical-session.target"];
      Install.WantedBy = ["graphical-session.target"];

      Service = {
        Environment = "PATH=/run/wrappers/bin:${lib.makeBinPath deps}";
        ExecStart = "${cfg.package}/bin/ags";
        Restart = "on-failure";
      };
    };
  };
}
