# straight from fufexan/dotfiles, go check it out
{
  inputs,
  pkgs,
  lib,
  ...
}: let
  programs = lib.makeBinPath (with pkgs; [
    inputs.hyprland.packages."${pkgs.system}".default
    coreutils
    libnotify
  ]);

  startscript = pkgs.writeShellScript "gamemode-start" ''
    export PATH=$PATH:${programs}
    export HYPRLAND_INSTANCE_SIGNATURE=$(ls -1 /tmp/hypr | tail -1)
    hyprctl --batch 'keyword decoration:blur:enabled 0 ; keyword animations:enabled 0'

    notify-send -i 'computer-symbolic' 'Gamemode started!' 'Disabling useless stuff' -u 'low'
  '';

  endscript = pkgs.writeShellScript "gamemode-end" ''
    export PATH=$PATH:${programs}
    export HYPRLAND_INSTANCE_SIGNATURE=$(ls -1 /tmp/hypr | tail -1)
    hyprctl --batch 'keyword decoration:blur:enabled 1 ; keyword animations:enabled 1'

    notify-send -i 'computer-symbolic' 'Gamemode ended!' 'Enabling the pretty stuff' -u 'low'
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

  boot.kernel.sysctl = {
    # this is default on Fedora, and I used it on Arch too
    # TODO: remember all the stuff I forgot to add
    "vm.max_map_count" = 2147483642;
  };
}
