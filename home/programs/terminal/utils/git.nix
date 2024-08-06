{pkgs, ...}: {
  home.packages = [pkgs.gh];

  programs.git = {
    enable = true;

    ignores = ["*~" "node_modules" "target"];
    signing = {
      signByDefault = true;
      key = "9F726CE991F7ACD8";
    };

    userName = "Lucas Portela";
    userEmail = "contato.koish@gmail.com";

    extraConfig = {
      credential.helper = "${pkgs.gitFull}/bin/git-credential-libsecret";
    };
  };
}
