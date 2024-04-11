{pkgs, ...}: {
  home.packages = [pkgs.webcord-vencord];

  xdg.configFile."WebCord/Themes/theme".text = ''
    @import url("https://catppuccin.github.io/discord/dist/catppuccin-mocha-teal.theme.css");
  '';

  services.arrpc = {
    enable = true;
    package = pkgs.arrpc.overrideAttrs (_: {
      pname = "arrpc";
      version = "3.3.1";

      src = pkgs.fetchFromGitHub {
        owner = "OpenAsar";
        repo = "arrpc";
        rev = "b4796fffe3bf1b1361cc4781024349f7a4f9400e";
        hash = "sha256-iEfV85tRl2KyjodoaSxVHiqweBpLeiCAYWc8+afl/sA=";
      };
    });
  };
}
