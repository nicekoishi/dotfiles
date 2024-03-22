{pkgs, ...}: {
  home.packages = [pkgs.gh];

  programs.git = {
    enable = true;

    ignores = ["*~" "node_modules" "target"];

<<<<<<< HEAD
    userEmail = "contato.koish@gmail.com";
    userName = "Lucas Portela";
=======
    userName = "Lucas Portela";
    userEmail = "contato.koish@gmail.com";
>>>>>>> 12c72a1 (too lazy to separate them all)
  };
}
