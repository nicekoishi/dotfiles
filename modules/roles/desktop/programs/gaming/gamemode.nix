# straight from fufexan/dotfiles, go check it out
# https://github.com/fufexan/dotfiles/blob/3b0075fa7a5d38de13c8c32140c4b020b6b32761/modules/gamemode.nix
{
  inputs',
  pkgs,
  lib,
  ...
}: let
  programs = lib.makeBinPath (with pkgs; [
    inputs'.hyprland.packages.default
    coreutils
    jq
    libnotify
    power-profiles-daemon
    systemd
  ]);

  startscript = pkgs.writeShellScript "gamemode-start" ''
    export PATH=$PATH:${programs}

    for instance in $(hyprctl instances -j | jq ".[].instance" -r); do
      HYPRLAND_INSTANCE_SIGNATURE="$instance" \
      hyprctl --batch 'keyword decoration:blur:enabled 0 ; keyword animations:enabled 0'
    done

    powerprofilesctl set performance
    notify-send -i 'computer-symbolic' 'Gamemode started!' 'Disabling useless stuff' -u 'low'
  '';

  endscript = pkgs.writeShellScript "gamemode-end" ''
    export PATH=$PATH:${programs}

    for instance in $(hyprctl instances -j | jq ".[].instance" -r); do
      HYPRLAND_INSTANCE_SIGNATURE="$instance" \
      hyprctl --batch 'keyword decoration:blur:enabled 1 ; keyword animations:enabled 1'
    done

    powerprofilesctl set balanced
    notify-send -i 'computer-symbolic' 'Gamemode ended!' 'Enabling the pretty stuff' -u 'low'
  '';
in {
  users.groups.gamemode = {};

  programs.gamemode = {
    enable = true;
    enableRenice = true;
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
