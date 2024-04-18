{pkgs, ...}: let
  mocha = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "discord";
    rev = "fa735cd9a89732f4b27ff14309c2af1581622ae5";
    hash = "sha256-1H5l2E0VBUL1/k7tf21gXGVT158koARug/KeLixCukU=";
  };
in {
  home.packages = [pkgs.webcord-vencord];

  xdg.configFile.
  "WebCord/Themes/theme" = {
    source = "${mocha}/themes/mocha.theme.css";
  };

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
