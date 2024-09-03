{
  callPackage,
  delve,
  go,
  gopls,
}: let
  main = callPackage ./default.nix {};
in
  main.overrideAttrs (prev: {
    nativeBuildInputs =
      [
        delve
        go
        gopls
      ]
      ++ (prev.nativeBuildInputs or []);
  })
