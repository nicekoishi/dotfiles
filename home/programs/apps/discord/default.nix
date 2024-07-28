{pkgs, ...}: let
  mocha = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "discord";
    rev = "fa735cd9a89732f4b27ff14309c2af1581622ae5";
    hash = "sha256-1H5l2E0VBUL1/k7tf21gXGVT158koARug/KeLixCukU=";
  };
in {
  home.packages = [pkgs.vesktop];

  xdg.configFile."vesktop/themes/Catppuccin.theme.css" = {
    source = "${mocha}/themes/mocha.theme.css";
  };

  services.arrpc = {
    enable = true;
    package = pkgs.arrpc.overrideAttrs (prev: {
      pname = "arrpc";
      version = "3.4.0";

      src = pkgs.fetchFromGitHub {
        owner = "OpenAsar";
        repo = "arrpc";
        rev = "c62ec6a04c8d870530aa6944257fe745f6c59a24";
        hash = "sha256-wIRr+LnOp9PW7v5xOqpdB6AjqINBlYFkoGRorYkRC2I=";
      };

      # TODO: add detectable.json patch
      patches =
        (prev.patches or [])
        ++ [];
    });
  };
}
