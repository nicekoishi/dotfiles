# https://github.com/NotAShelf/nyx/blob/main/parts/lib/builders.nix
{
  inputs,
  lib,
  ...
}: let
  inherit (inputs) self nixpkgs;
  inherit (lib.attrsets) recursiveUpdate;
  inherit (lib.lists) concatLists flatten singleton;
  inherit (lib.modules) mkDefault;

  # ... alias
  mkSystem = lib.nixosSystem;

  # Generates a list of modules to be import by a host.
  mkModuleList = path: hostname: {
    common,
    roles,
    extraModules,
    ...
  } @ args:
    flatten (concatLists [
      # Import the host defined on path. Do note that path is empty by default,
      # so don't forget to override it
      # mkModulesFor' = mkModulesFor ./. <...>
      (singleton "${path}/${hostname}")

      # Modules that should be common to all hosts.
      # For example, we have options definitions and secrets.
      (args.common or [])

      # Relevant roles of this host, check modules/roles
      (args.roles or [])

      # For things that aren't necessarily roles, but aren't generic enough
      # to be put into extraModules
      (args.profiles or [])

      # Any extra module that shouldn't be on roles or profiles, i.e generic:
      # inputs.home-manager.nixosModules.default
      (args.extraModules or [])
    ]);

  # It's a convenient way to pass system and specialArgs, so why not use it?
  # https://flake.parts/module-arguments#withsystem
  mkNixosSystem = {
    hostname,
    system,
    withSystem,
    ...
  } @ args:
    withSystem system ({
      inputs',
      self',
      ...
    }:
      mkSystem {
        specialArgs = recursiveUpdate {
          inherit lib;
          inherit inputs self inputs' self';
        } (args.specialArgs or {});

        # NOTE: is there a problem flattening this list here instead of smaller flattens?
        modules = concatLists [
          (singleton {
            networking.hostName = args.hostname;
            nixpkgs.hostPlatform = mkDefault args.system;
          })

          # NOTE: and here things like chaotic or nur or any module actually
          (args.modules or [])
        ];
      });

  mkNixosIso = args:
    mkNixosSystem (args
      // {
        modules =
          args.modules
          ++ [
            "${nixpkgs}/nixos/modules/installer/cd-dvd/channel.nix"
            "${nixpkgs}/nixos/modules/installer/cd-dvd/iso-image.nix"
            "${nixpkgs}/nixos/modules/profiles/all-hardware.nix"
          ];
      });
in {
  inherit mkNixosSystem mkNixosIso mkModuleList;
}
