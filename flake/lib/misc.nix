{lib, ...}: let
  inherit (builtins) substring;
  inherit (lib.strings) removePrefix toUpper;

  # https://github.com/fufexan/dotfiles/blob/facb14706440d7c2105ddc88f27620648fe98d3a/pkgs/bibata-hyprcursor/default.nix
  capitalize = string: let
    toCapital = substring 0 1 string;
    nonCapital = removePrefix toCapital string;
  in
    toUpper toCapital + nonCapital;
in {
  inherit capitalize;
}
