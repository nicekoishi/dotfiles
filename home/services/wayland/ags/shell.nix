{pkgs ? import <nixpkgs> {}}: let
  inherit (pkgs) mkShell writeShellScriptBin;
in
  mkShell {
    buildInputs = with pkgs; [
      nodejs-slim

      # eslint setup
      nodePackages.pnpm

      # the following scripts are always run using pnpm, so they should always run in the base path

      # compiling the stylesheets, pretty cool tbh
      dart-sass
      (writeShellScriptBin "compile-stylesheet" ''
        mkdir -p $out
        ${dart-sass}/bin/sass --verbose \
          --no-source-map \
          ./style/main.scss > ./style.css

        cp ./style.css $out/style.css

        sed -i "s|style: \"style.css\"|style: \"$out/style.css\"|" $out/style.css
      '')
      # this will run after compile-stylesheet, and its just for testing anyway
      (writeShellScriptBin "build-ags-config" ''
        mkdir -p $out
        cp -r ./assets $out/assets

        ${bun}/bin/bun build ./config.ts \
          --public-path . \
          --target bun \
          --external "resource://*" \
          --external "gi://*" \
          --external "file://*" \
          --outfile $out/config.js

        sed -i "s|App.addIcons(\"assets\")|App.addIcons("\"$out/assets"\")|" $out/config.js
      '')
    ];
  }
