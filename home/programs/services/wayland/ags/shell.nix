{pkgs ? import <nixpkgs> {}}: let
  inherit (pkgs) mkShell writeShellScriptBin;
in
  mkShell {
    buildInputs = with pkgs; [
      nodejs-slim

      # eslint setup
      nodePackages.pnpm

      # compiling the stylesheets, pretty cool tbh
      dart-sass
      (writeShellScriptBin "compile-stylesheet" ''
        ${dart-sass}/bin/sass --verbose \
        --style compressed \
        --no-source-map \
        ./style/main.scss > ./style.css
      '')
    ];
  }
