{
  inputs,
  lib,
  ...
}: let
  inherit (inputs) self;
  inherit (lib.attrsets) recursiveUpdate;
  inherit (lib.lists) singleton concatLists; # NOTE: is there a difference between builtins.concatLists and its lib counterpart?
  inherit (lib.modules) mkDefault;

  # you can say this is a ripoff of https://github.com/NotAShelf/nyx/blob/main/parts/lib/builders.nix
  # and you're right, this is.
  # still think that everything should be in a separate namespace, as to not confuse with
  # the 'normal' nixpkgs.lib
  nice = rec {
    mkSystem = lib.nixosSystem;

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
            inherit lib; # NOTE: wait a sec, does this pass the default lib or my extended lib?
            inherit inputs self inputs' self';
          } (args.specialArgs or {});

          modules = concatLists [
            # NOTE: if I understood it correctly, it should return something like this
            # [{...}]
            (singleton {
              networking.hostName = args.hostname;
              nixpkgs.hostPlatform = mkDefault args.system;
            })

            # NOTE: and here things like chaotic or nur
            (args.modules or [])
          ];
        });
  };
in {
  inherit nice;
}
