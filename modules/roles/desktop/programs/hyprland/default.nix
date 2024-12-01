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
  inherit (inputs'.hyprland.packages) hyprland xdg-desktop-portal-hyprland;

  cfg = config.nice;
  env = cfg.user.desktop;

  /*
  passthru is needed for usage with services.displayManager.sessionPackages or
  error: Package, 'Hyprland', did not specify any session names, as strings, in
  'passthru.providedSessions'. This is required when used as a session package.
  */
  hyprlandSession = let
    name = "Hyprland";
  in
    (pkgs.writeTextFile {
      inherit name;
      destination = "/share/wayland-sessions/${toLower name}.desktop";
      text = ''
        [Desktop Entry]
        Name=${name}
        Comment=An intelligent dynamic tiling Wayland compositor
        Exec=${pkgs.systemd}/bin/systemd-cat --identifier=${name} ${name}
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
      hyprland
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
      configPackages = [hyprland];
      extraPortals = [
        xdg-desktop-portal-hyprland
      ];
    };
  };
}
