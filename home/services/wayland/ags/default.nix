# 'borrowed' from notashelf/nyx
# https://github.com/NotAShelf/nyx/blob/d407b4d6e5ab7f60350af61a3d73a62a5e9ac660/homes/notashelf/services/wayland/ags/default.nix
{
  config,
  inputs,
  inputs',
  lib,
  pkgs,
  ...
}: let
  inherit (lib.fileset) fileFilter unions difference toSource;

  requiredDeps = with pkgs; [
    inputs'.hyprland.packages.default

    # scripts and helpers
    bash
    coreutils
    imagemagick
    libnotify
    ripgrep
  ];

  guiDeps = with pkgs; [
    mission-center
    gnome-calendar
    pwvucontrol
  ];

  dependencies = requiredDeps ++ guiDeps;

  baseSrc = unions [
    ./assets
    ./style
    ./utils
    ./widgets
    ./config.ts
    ./tsconfig.json
  ];

  agsSrc = toSource {
    root = ./.;
    fileset = filter;
  };

  filterNixFiles = fileFilter (file: lib.hasSuffix ".nix" file.name) ./.;
  filter = difference baseSrc filterNixFiles;

  agsConfig = pkgs.runCommand "build-ags-configuration" {nativeBuildInputs = [pkgs.bun pkgs.dart-sass];} ''
    mkdir -p $out
    cp -r ${agsSrc}/assets $out/

    sass --verbose \
      --no-source-map \
      ${agsSrc}/style/main.scss \
      $out/style.css

    bun build ${agsSrc}/config.ts \
      --public-path ${agsSrc} \
      --target bun \
      --external "resource://*" \
      --external "gi://*" \
      --external "file://*" \
      --outfile $out/config.js

    substituteInPlace $out/config.js \
      --replace-warn "App.addIcons(\"assets\")" "App.addIcons(\"$out/assets\")" \
      --replace-warn "style: \"style.css\"" "style: \"$out/style.css\""
  '';
in {
  imports = [
    inputs.ags.homeManagerModules.default
  ];

  programs.ags.enable = true;

  systemd.user.services.ags = {
    Unit = {
      Description = "Aylur's Gtk Shell";
      After = [
        "graphical-session.target"
      ];
    };
    Service = {
      Environment = "PATH=/run/wrappers/bin:${lib.makeBinPath dependencies}";
      ExecStart = ''
        ${config.programs.ags.package}/bin/ags --config ${agsConfig}/config.js
      '';
      ExecReload = "${pkgs.coreutils}/bin/kill -SIGUSR2 $MAINPID";

      Restart = "on-failure";
      KillMode = "mixed";
    };
    Install.WantedBy = ["graphical-session.target"];
  };
}
