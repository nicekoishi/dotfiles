{pkgs, ...}: {
  home.packages = with pkgs; [
    neofetch
    nvtopPackages.full
  ];
}
