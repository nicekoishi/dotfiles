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

  # still think that everything should be in a separate namespace, as to not confuse with
  # the 'normal' nixpkgs.lib
  mkSystem = lib.nixosSystem;

  # since there's a flatten on the main builder already, this shouldn't be a problem
  mkModulesFor = path: defaults: hostname: modules: [
    "${path}/${hostname}"
    modules
    defaults
  ];

  # it's a convenient way to pass system and specialArgs, so why not use it?
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
        modules = flatten (concatLists [
          (singleton {
            networking.hostName = args.hostname;
            nixpkgs.hostPlatform = mkDefault args.system;
          })

          # NOTE: and here things like chaotic or nur or any module actually
          (args.modules or [])
        ]);
      });

  mkNixosIso = args:
    mkNixosSystem (args
      // {
        modules =
          args.modules
          ++ [
            "${nixpkgs}/nixos/modules/installers/cd-dvd/channel.nix"
          ];
      });
in {
  inherit mkNixosSystem mkNixosIso mkModulesFor;
}
