# https://github.com/NotAShelf/nyx/blob/main/parts/lib/builders.nix
{
  inputs,
  lib,
  ...
}: let
  inherit (inputs) self;
  inherit (lib.attrsets) recursiveUpdate;
  inherit (lib.lists) concatLists flatten singleton;
  inherit (lib.modules) mkDefault;

  # still think that everything should be in a separate namespace, as to not confuse with
  # the 'normal' nixpkgs.lib
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
    }: let
      # NOTE: is there a better way to do this? like defaulting to "${self}/hosts" if not defined
      # but throwing an error if this default value is used in another flake?
      host.path =
        if (args ? hosts)
        then "${args.hosts}/${hostname}"
        else builtins.throw "Don't forget to set hosts when calling mkNixosSystem!";
    in
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

          (singleton host.path)

          # NOTE: and here things like chaotic or nur or any module actually
          (args.modules or [])
        ]);
      });
in {
  inherit mkNixosSystem;
}
