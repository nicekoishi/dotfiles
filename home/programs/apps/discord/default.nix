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
      version = "3.4.0";

      src = pkgs.fetchFromGitHub {
        owner = "OpenAsar";
        repo = "arrpc";
        rev = "59553e276716cde3c0afa8bff56aa8af3ab774cc";
        hash = "sha256-kjpsPWjgoSNs569DfN8T3/lPB8MzUck7QqD/wfNL8To=";
      };
    });
  };
}
