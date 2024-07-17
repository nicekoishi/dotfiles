{pkgs, ...}: {
  imports = [
    #./grand-theft-auto-v
    #./zenless-zone-zero
  ];

  home.packages = with pkgs; [
    legendary-gl
  ];
}
