{pkgs, ...}: let
  mocha = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "discord";
    rev = "fa735cd9a89732f4b27ff14309c2af1581622ae5";
    hash = "sha256-1H5l2E0VBUL1/k7tf21gXGVT158koARug/KeLixCukU=";
  };
in {
  home.packages = [pkgs.equibop];

  xdg.configFile."equibop/themes/catppuccin.theme.css" = {
    source = "${mocha}/themes/mocha.theme.css";
  };

  services.arrpc.enable = true;
}
