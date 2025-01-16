{pkgs, ...}: {
  home.packages = [pkgs.gh];

  programs.git = {
    enable = true;
    userName = "Lucas Portela";
    userEmail = "contato.koish@gmail.com";

    ignores = ["*~" "node_modules" "target"];
    signing = {
      signByDefault = true;
      key = "FA522AB41F9C2374";
    };

    difftastic = {
      enable = true;
      background = "dark";
      color = "always";
      display = "side-by-side-show-both";
    };

    extraConfig = {
      credential.helper = "${pkgs.gitFull}/bin/git-credential-libsecret";
    };
  };
}
