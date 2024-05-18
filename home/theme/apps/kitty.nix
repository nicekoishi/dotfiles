{
  lib,
  pkgs,
  ...
}: let
  deps = lib.makeBinPath [pkgs.kitty];

  kitty-dark = pkgs.writeShellScriptBin "kitty-dark" ''
    PATH=$PATH:${deps}
    kitty +kitten themes --config-file-name=theme.conf --reload-in=all Catppuccin-Mocha
  '';

  kitty-light = pkgs.writeShellScriptBin "kitty-light" ''
    PATH=$PATH:${deps}
    kitty +kitten themes --config-file-name=theme.conf --reload-in=all Catppuccin-Latte
  '';
in {
  services.darkman = {
    darkModeScripts = {kitty = lib.getExe kitty-dark;};
    lightModeScripts = {kitty = lib.getExe kitty-light;};
  };
}
