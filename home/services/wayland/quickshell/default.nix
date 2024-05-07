{
  inputs,
  pkgs,
  ...
}: let
  inherit (inputs) quickshell;
in {
  home.packages = [quickshell.packages."${pkgs.system}".nvidia];
}
