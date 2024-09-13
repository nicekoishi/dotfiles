{
  config,
  inputs,
  lib,
  pkgs,
  self,
  ...
}: let
  inherit (lib.modules) mkForce;
in {
  imports = [
    ./nh.nix
    ./overlays.nix
    ./substituters.nix
  ];

  system = {
    autoUpgrade.enable = mkForce false;
    configurationRevision = self.shortRev or self.dirtyShortRev;
  };

  # save flake locally on /etc/nixos/dotfiles
  environment.etc."nicekoishi/dotfiles" = {
    source = inputs.self;
    # https://github.com/NixOS/nixpkgs/issues/200744
    # this won't work if set to any mode that's not symlink
    #mode = "0644";
  };

  nix = {
    # pin the registry to avoid downloading and evaluating a new nixpkgs version every time
    registry = lib.mapAttrs (_: v: {flake = v;}) inputs;

    # set the path for channels compat
    nixPath = lib.mapAttrsToList (key: _: "${key}=flake:${key}") config.nix.registry;

    # nix for lesbians
    package = pkgs.lix;

    daemonIOSchedClass = "idle";
    daemonCPUSchedPolicy = "batch";
    daemonIOSchedPriority = 7;

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

      # automatically optimise symlinks, saving space
      auto-optimise-store = true;

      # crappy cpu + compiling = a bad time
      # one day I will have another build machine
      builders-use-substitutes = true;

      http-connections = 0;

      # direnv GC roots
      keep-derivations = true;
      keep-outputs = true;

      keep-going = true;

      # log lines for failed builds
      log-lines = 50;

      max-jobs = "auto";

      # for builds inside cgroups
      use-cgroups = true;

      # i can have a clean home now? nice
      use-xdg-base-directories = true;

      # i know, shut up
      warn-dirty = false;

      allowed-users = ["root" "@wheel" "nix-builder"];
      trusted-users = ["root" "@wheel" "nix-builder"];
    };
  };

  documentation = {
    doc.enable = false;
    nixos.enable = true;
    info.enable = false;

    man = {
      enable = true;
      generateCaches = true;
    };
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = [pkgs.git];
}
