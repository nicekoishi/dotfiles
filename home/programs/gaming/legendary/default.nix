{pkgs, ...}: {
  imports = [
    #./grand-theft-auto-v
  ];

  home.packages = with pkgs; [
    legendary-gl
  ];
}
