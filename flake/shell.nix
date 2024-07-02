{
  perSystem = {
    config,
    pkgs,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      name = "nice";
      meta.description = "Default development shell for this flake";

      # funny enoug, this doesn't work alone for me. I had to set the variable globally. skill issue
      DIRENV_LOG_FORMAT = "";

      inputsFrom = [config.treefmt.build.devShell];

      packages = with pkgs; [
        # would something bad happen if I forget this?
        git

        # omg this is so cool
        config.treefmt.build.wrapper

        # nix
        alejandra
        deadnix
        nil
        statix

        # lazy
        (pkgs.writeShellApplication {
          name = "update";
          text = ''nix flake update && git commit flake.lock -m " chore: flake update" '';
        })
      ];
    };
  };
}
