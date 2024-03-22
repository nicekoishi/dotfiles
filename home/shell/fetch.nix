{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    neofetch
    nvtop
  ];
}
