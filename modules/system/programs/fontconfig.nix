{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib.modules) mkIf;
  inherit (config.nice.host.opts) roles;
in {
  fonts = mkIf (builtins.elem "desktop" roles) {
    enableDefaultPackages = false;

    fontDir = {
      enable = true;
      decompressFonts = true;
    };

    packages = with pkgs; [
      material-symbols

      # macrohard onfire
      corefonts
      vista-fonts

      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji

      # yay
      nerd-fonts.iosevka
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
    ];

    fontconfig.defaultFonts = {
      serif = ["Iosevka Nerd Font"];
      sansSerif = ["Iosevka Nerd Font"];
      monospace = ["Iosevka Nerd Font Mono"];
      emoji = ["Noto Color Emoji"];
    };
  };
}
