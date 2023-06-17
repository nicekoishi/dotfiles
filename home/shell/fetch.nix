{
  inputs,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    inputs.nix-utils.packages.${pkgs.system}.fastfetch
    neofetch
    nvtop
  ];
}
