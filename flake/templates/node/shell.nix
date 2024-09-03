{
  callPackage,
  eslint_d,
  prettierd,
}: let
  main = callPackage ./default.nix {};
in
  main.overrideAttrs (prev: {
    nativeBuildInputs =
      [
        eslint_d
        prettierd
      ]
      ++ (prev.nativeBuildInputs or []);

    shellHook = ''
      eslint_d start
      eslint_d status
    '';
  })
