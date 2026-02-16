{pkgs, ...}: {
  home.packages = with pkgs; [
    libreoffice-fresh
    hyphen
    hunspell
    hunspellDicts.pt_BR
    hunspellDicts.en_US-large
    hunspellDicts.en_GB-large
  ];
}
