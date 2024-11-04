{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = false;

    fontDir = {
      enable = true;
      decompressFonts = true;
    };

    packages = with pkgs; [
      material-symbols

      # macrohard onfire
      corefonts
      vistafonts

      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji

      # yay
      (nerdfonts.override {fonts = ["Iosevka" "FiraCode" "JetBrainsMono"];})
    ];

    fontconfig.defaultFonts = {
      serif = ["Iosevka Nerd Font"];
      sansSerif = ["Iosevka Nerd Font"];
      monospace = ["Iosevka Nerd Font Mono"];
      emoji = ["Noto Color Emoji"];
    };
  };
}
