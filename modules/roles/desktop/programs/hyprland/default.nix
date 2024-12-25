# https://github.com/NixOS/nixpkgs/blob/nixos-unstable/nixos/modules/programs/wayland/hyprland.nix
{
  config,
  inputs',
  lib,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (inputs'.hyprland.packages) hyprland xdg-desktop-portal-hyprland;

  cfg = config.nice;
  env = cfg.user.desktop;
in {
  # doesn't matter, as we're not using it anyway if it's not enabled
  disabledModules = ["programs/hyprland"];

  config = mkIf env.hyprland.enable {
    # now I can safely do this, as we're enabling all the necessary options manually

    # we don't need it, as the session entry can launch it directly
    # still safe to follow nixpkgs and add to environment.systemPackages
    environment.systemPackages = [
      hyprland
    ];

    programs.uwsm.waylandCompositors = {
      hyprland = {
        prettyName = "Hyprland";
        comment = "Hyprland compositor managed by UWSM";
        binPath = "/run/current-system/sw/bin/Hyprland";
      };
    };

    /*
    Set environment path of systemd to include the current system’s bin directory.
    This is needed in Hyprland setups, where opening links in applications do not work.
    Enabled by default.
    */
    systemd.user.extraConfig = ''
      DefaultEnvironment="PATH=/run/wrappers/bin:/etc/profiles/per-user/%u/bin:/nix/var/nix/profiles/default/bin:/run/current-system/sw/bin:$PATH"
    '';

    # portal setup
    xdg.portal = {
      enable = true;
      configPackages = [hyprland];
      extraPortals = [
        xdg-desktop-portal-hyprland
      ];
    };
  };
}
