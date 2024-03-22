{pkgs, ...}: {
  home.packages = [pkgs.gh];

  programs.git = {
    enable = true;

    ignores = ["*~" "node_modules" "target"];

    userName = "Lucas Portela";
    userEmail = "contato.koish@gmail.com";
  };
}
