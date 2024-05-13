{
  config,
  lib,
  pkgs,
  ...
}: let
  discord-dark = pkgs.writeShellScriptBin "discord-dark" ''
    url="@import url("https://catppuccin.github.io/discord/dist/catppuccin-mocha.theme.css");"
    config="${config.xdg.configHome}/vesktop/settings/quickCss.css"
    tmp=$(mktemp)

    awk -v url="$url" 'NR==1 {$0=url} 1' "$config" > "$tmp" && mv "$tmp" "$config"
  '';

  discord-light = pkgs.writeShellScriptBin "discord-light" ''
    url="@import url("https://catppuccin.github.io/discord/dist/catppuccin-latte.theme.css");"
    config="${config.xdg.configHome}/vesktop/settings/quickCss.css"
    tmp=$(mktemp)

    awk -v url="$url" 'NR==1 {$0=url} 1' "$config" > "$tmp" && mv "$tmp" "$config"
  '';
in {
  services.darkman = {
    darkModeScripts = {vesktop = lib.getExe discord-dark;};
    lightModeScripts = {vesktop = lib.getExe discord-light;};
  };
}
