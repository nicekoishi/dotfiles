{
  inputs,
  lib,
  ...
}: let
  inherit (inputs) nixpkgs;

  nice.mkSystem = lib.nixosSystem;
in {
  inherit nice;
}
