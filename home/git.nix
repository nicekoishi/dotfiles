{pkgs, ...}: {
  home.packages = [pkgs.gh];

  programs.git = {
    enable = true;

    ignores = ["*~" "node_modules" "target"];

    userEmail = "contato.koish@gmail.com";
    userName = "Lucas Portela";
  };
}
