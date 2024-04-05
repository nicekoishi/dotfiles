{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [./substituters.nix ./nh.nix];
  nix = {
    # pin the registry to avoid downloading and evaluating a new nixpkgs version every time
    registry = lib.mapAttrs (_: v: {flake = v;}) inputs;

    # set the path for channels compat
    nixPath = lib.mapAttrsToList (key: _: "${key}=flake:${key}") config.nix.registry;

    # i was doing it manually before. am i stupid?
    gc = {
      automatic = true;
      dates = "Mon *-*-* 03:00";
      options = "--delete-older-than 7d";
    };

    # if auto-optimise-store is on, why this?
    optimise = {
      automatic = true;
      dates = ["04:00"];
    };

    settings = {
      extra-experimental-features = [
        "nix-command"
        "flakes"
        "cgroups"
      ];

      flake-registry = "/etc/nix/registry.json";

      # crappy cpu + compiling = a bad time
      # one day I will have another build machine
      builders-use-substitutes = true;

      # automatically optimise symlinks, saving space
      auto-optimise-store = true;

      keep-going = true;

      # i know, shut up
      warn-dirty = false;

      max-jobs = "auto";

      # for builds inside cgroups
      use-cgroups = true;

      # direnv GC roots
      keep-derivations = true;
      keep-outputs = true;

      # why limit it? oh wait
      http-connections = 0;

      # log lines for failed builds
      log-lines = 50;

      allowed-users = ["root" "@wheel" "nix-builder"];
      trusted-users = ["root" "@wheel" "nix-builder"];
    };
  };

  documentation = {
    doc.enable = false;
    nixos.enable = true;
    info.enable = false;
    man = {
      enable = lib.modules.mkDefault true;
      generateCaches = lib.modules.mkDefault true;
    };
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = [pkgs.git];
}
