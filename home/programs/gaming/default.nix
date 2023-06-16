{pkgs, ...}: {
  imports = [
    ./minecraft
    ./honkers
  ];

  home.packages = with pkgs; [
    heroic
    lutris
  ];
}
