{
  self',
  lib,
  ...
}: let
  inherit (self'.packages) nicekoishi-dotfiles-docs;
in {
  imports = [
    ./extra
    ./host
    ./user
  ];
  environment.etc."nicekoishi/documentation" = {
    # keep it local
    source = nicekoishi-dotfiles-docs.override {
      optionsDocArgs.transformOptions = lib.id;
    };
  };
}
