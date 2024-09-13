# straight from fufexan/dotfiles, go check it out
# https://github.com/fufexan/dotfiles/blob/3b0075fa7a5d38de13c8c32140c4b020b6b32761/modules/gamemode.nix
{
  config,
  inputs',
  pkgs,
  lib,
  ...
}: let
  inherit (lib.strings) makeBinPath optionalString;

  cfg = config.nice;
  env = cfg.user.environments;

  programs = makeBinPath (with pkgs; [
    inputs'.hyprland.packages.default
    coreutils
    jq
    libnotify
    power-profiles-daemon
    pipewire
    systemd
  ]);

  startscript = pkgs.writeShellScript "gamemode-start" ''
    export PATH=$PATH:${programs}

    ${optionalString env.hyprland.enable ''
      for instance in $(hyprctl instances -j | jq ".[].instance" -r); do
        HYPRLAND_INSTANCE_SIGNATURE="$instance" \
        hyprctl --batch 'keyword decoration:blur:enabled 0 ; keyword animations:enabled 0'
      done
    ''}

    pw-metadata -n settings 0 clock.force-quantum 1024

    powerprofilesctl set performance
    notify-send -i 'applications-games-symbolic' 'Gamemode started!' 'Disabling useless stuff' -u 'low'
  '';

  endscript = pkgs.writeShellScript "gamemode-end" ''
    export PATH=$PATH:${programs}

    ${optionalString env.hyprland.enable ''
      for instance in $(hyprctl instances -j | jq ".[].instance" -r); do
        HYPRLAND_INSTANCE_SIGNATURE="$instance" \
        hyprctl --batch 'keyword decoration:blur:enabled 1 ; keyword animations:enabled 1'
      done
    ''}

    pw-metadata -n settings 0 clock.force-quantum 0

    powerprofilesctl set balanced
    notify-send -i 'applications-games-symbolic' 'Gamemode ended!' 'Enabling the pretty stuff' -u 'low'
  '';
in {
  # By default low latency is disabled when using gamemode, and it's enabled back
  # when gamemode ends
  # TODO: Pass an argument to enable/disable low latency instead.
  # Things that didn't work:
  # - Environment variables:
  #   Even when using GAMEMODERUNEXEC, it won't pass LOWLATENCY to the startup script but instead pass it to the game
  # - echo 1 > /tmp/gamemode.LOWLATENCY:
  #   Yes, a file in tmp that is read by the startup script. This will work, but not with steam for some reason.
  #   Steam can write to $HOME though...
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

  security.wrappers.gamemode = {
    owner = "root";
    group = "root";
    source = "${pkgs.gamemode}/bin/gamemoderun";
    capabilities = "cap_sys_ptrace,cap_sys_nice+pie";
  };

  boot.kernel.sysctl = {
    # this is default on Fedora, and I used it on Arch too
    # TODO: remember all the stuff I forgot to add
    "vm.max_map_count" = 2147483642;
  };
}
