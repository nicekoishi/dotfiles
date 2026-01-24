{pkgs, ...}: {
  home.packages = [pkgs.gh];

  programs.git = {
    enable = true;

    ignores = ["*~" "node_modules" "target"];
    #signing = {
    #  signByDefault = true;
    #  key = "FA522AB41F9C2374";
    #};

    settings = {
      credential.helper = "${pkgs.gitFull}/bin/git-credential-libsecret";

      user = {
        name = "Lucas Portela";
        email = "contato.koish@gmail.com";
      };
    };
  };

  programs.difftastic = {
    enable = true;
    git.enable = true;
    options = {
      background = "dark";
      color = "always";
      display = "side-by-side-show-both";
    };
  };
}
