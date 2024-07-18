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
        # also: https://github.com/NixOS/nix/issues/6941#issuecomment-1230136775
        (pkgs.writeShellApplication {
          name = "update";
          text = ''nix --option commit-lockfile-summary "chore: flake update" flake update --commit-lock-file '';
        })
      ];
    };
  };
}
