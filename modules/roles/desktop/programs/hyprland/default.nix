# https://github.com/NixOS/nixpkgs/blob/nixos-unstable/nixos/modules/programs/wayland/hyprland.nix
{
  config,
  inputs',
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (lib.strings) toLower;

  cfg = config.nice;
  env = cfg.user.environments;
  hyprlandPkg = inputs'.hyprland.packages.hyprland;

  /*
  passthru is needed for usage with services.displayManager.sessionPackages or
  error: Package, 'Hyprland', did not specify any session names, as strings, in
  'passthru.providedSessions'. This is required when used as a session package.
  */
  hyprlandSession =
    (pkgs.writeTextFile {
      name = "Hyprland";
      destination = "/share/wayland-sessions/${toLower hyprlandSession.name}.desktop";
      text = ''
        [Desktop Entry]
        Name=${hyprlandSession.name}
        Comment=An intelligent dynamic tiling Wayland compositor
        Exec=${pkgs.systemd}/bin/systemd-cat --identifier=${hyprlandSession.name} ${hyprlandSession.name}
        Type=Application
      '';
    })
    .overrideAttrs (_: {passthru.providedSessions = ["hyprland"];});
in {
  # doesn't matter, as we're not using it anyway if it's not enabled
  disabledModules = ["programs/hyprland"];

  config = mkIf env.hyprland.enable {
    # now I can safely do this, as we're enabling all the necessary options manually

    # we don't need it, as the session entry can launch it directly
    # still safe to follow nixpkgs and add to environment.systemPackages
    environment.systemPackages = [
      hyprlandPkg
    ];

    services.displayManager.sessionPackages = [
      hyprlandSession
    ];

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
      configPackages = [hyprlandPkg];
      extraPortals = [
        (inputs'.xdph.packages.xdg-desktop-portal-hyprland.override {
          hyprland = hyprlandPkg;
        })
      ];
    };
  };
}
