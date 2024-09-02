{pkgs, ...}: {
  home.packages = [pkgs.gh];

  programs.git = {
    enable = true;

    ignores = ["*~" "node_modules" "target"];
    signing = {
      signByDefault = true;
      key = "FDD4A13AE926A114";
    };

    userName = "Lucas Portela";
    userEmail = "contato.koish@gmail.com";

    extraConfig = {
      credential.helper = "${pkgs.gitFull}/bin/git-credential-libsecret";
    };
  };
}
