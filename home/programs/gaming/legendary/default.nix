{pkgs, ...}: {
  imports = [
    #    ./gtav.nix
  ];

  home.packages = with pkgs; [
    legendary-gl
  ];
}
