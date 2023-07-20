{pkgs, ...}: {
  imports = [
    ./minecraft
  ];

  home.packages = with pkgs; [
    lutris
  ];
}
