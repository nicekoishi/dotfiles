{pkgs, ...}: {
  imports = [
    ./minecraft
    ./honkers
  ];

  home.packages = with pkgs; [
    lutris
  ];
}
