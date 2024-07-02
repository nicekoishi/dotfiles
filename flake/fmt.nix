{
  perSystem = {
    inputs,
    config,
    pkgs,
    ...
  }: {
    formatter = config.treefmt.build.wrapper;

    treefmt = {
      projectRootFile = "flake.nix";

      programs = {
        alejandra.enable = true;

        prettier = {
          enable = true;
          package = pkgs.prettierd;
          settings = {
            editorconfig = true;
          };
        };
      };
    };
  };
}
