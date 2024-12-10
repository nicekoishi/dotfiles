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

  services.arrpc = {
    enable = true;
    package = pkgs.arrpc.overrideAttrs (prev: {
      pname = "arrpc";
      version = "3.4.0-uoogh";

      src = pkgs.fetchFromGitHub {
        owner = "OpenAsar";
        repo = "arrpc";
        rev = "3898488be9de93165fe05b3077154e0f0d946894";
        hash = "sha256-aTDSHgovPMWIwbmKEl0JelEqX8QKDRiMOom04T/vMOk=";
      };

      # add custom detectables to detectable.json
      buildPhase =
        (prev.buildPhase or "")
        + ''
          ${pkgs.jq}/bin/jq -c '. += input' src/process/detectable.json ${./custom-games.json} > detectable-custom.json
          mv detectable-custom.json src/process/detectable.json
        '';
    });
  };
}
