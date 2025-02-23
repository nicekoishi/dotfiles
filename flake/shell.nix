{
  perSystem = {
    inputs',
    pkgs,
    ...
  }: {
    devShells.default = pkgs.mkShell {
      name = "nice";
      meta.description = "Default development shell for this flake";

      # funny enoug, this doesn't work alone for me. I had to set the variable globally. skill issue
      DIRENV_LOG_FORMAT = "";

      packages = with pkgs; [
        inputs'.agenix.packages.default

        # nix
        alejandra
        deadnix
        nil
        statix
        git

        # lazy
        # also: https://github.com/NixOS/nix/issues/6941#issuecomment-1230136775
        (pkgs.writeShellApplication {
          name = "update";
          text = ''
            nix --option commit-lockfile-summary "chore: flake update" flake update --commit-lock-file
            echo "nix flake check beginning"
            nix flake check
          '';
        })
      ];
    };
  };
}
