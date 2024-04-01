{pkgs ? import <nixpkgs> {}}: let
  inherit (pkgs) mkShell;
in
  mkShell {
    buildInputs = with pkgs; [
      nodejs-slim

      # eslint setup
      nodePackages.pnpm

      # compiling the stylesheets, pretty cool tbh
      dart-sass
    ];
  }
