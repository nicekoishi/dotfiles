{inputs, ...}: {
  imports = [inputs.nix-index-db.homeModules.nix-index];

  home.sessionVariables = {
    NIX_AUTO_RUN = "1";
  };

  programs = {
    nix-index-database.comma.enable = true;
    nix-index = {
      enable = true;
      symlinkToCacheHome = true;
    };
  };
}
