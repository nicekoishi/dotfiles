# straight from fufexan/dotfiles, go check it out
{
  config,
  pkgs,
  lib,
  ...
}: let
  programs = lib.makeBinPath [
    config.programs.hyprland.package
    pkgs.coreutils
  ];

  startscript = pkgs.writeShellScript "gamemode-start" ''
    export PATH=$PATH:${programs}
    export HYPRLAND_INSTANCE_SIGNATURE=$(ls -1 /tmp/hypr | tail -1)
    hyprctl --batch 'keyword decoration:blur:enabled 0 ; keyword animations:enabled 0'
  '';

  endscript = pkgs.writeShellScript "gamemode-end" ''
    export PATH=$PATH:${programs}
    export HYPRLAND_INSTANCE_SIGNATURE=$(ls -1 /tmp/hypr | tail -1)
    hyprctl --batch 'keyword decoration:blur:enabled 1 ; keyword animations:enabled 1'
  '';
in {
  programs.gamemode = {
    enable = true;
    settings = {
      general = {
        softrealtime = "auto";
        renice = 15;
      };
      custom = {
        start = startscript.outPath;
        end = endscript.outPath;
      };
    };
  };
}
