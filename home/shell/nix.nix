{pkgs, ...}: {
  home.packages = with pkgs; [
    alejandra
    deadnix
    statix
    nil
  ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };
}
